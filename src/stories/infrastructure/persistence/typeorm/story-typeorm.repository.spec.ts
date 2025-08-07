import { Test, TestingModule } from '@nestjs/testing';
import { getRepositoryToken } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { StoryTypeOrmRepository } from './story-typeorm.repository';
import { StoryEntity } from './story.entity';
import { Story } from '../../../domain/story';
import { StoryMapper } from '../../../application/mappers/story.mapper';

describe('StoryTypeOrmRepository', () => {
  let repository: StoryTypeOrmRepository;
  // eslint-disable-next-line @typescript-eslint/no-unused-vars
  let typeormRepository: Repository<StoryEntity>;

  const mockTypeormRepository = {
    save: jest.fn(),
    findOneBy: jest.fn(),
    delete: jest.fn(),
  };

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [
        StoryTypeOrmRepository,
        {
          provide: getRepositoryToken(StoryEntity),
          useValue: mockTypeormRepository,
        },
      ],
    }).compile();

    repository = module.get<StoryTypeOrmRepository>(StoryTypeOrmRepository);
    typeormRepository = module.get<Repository<StoryEntity>>(
      getRepositoryToken(StoryEntity),
    );
  });

  afterEach(() => {
    jest.clearAllMocks();
  });

  it('should be defined', () => {
    expect(repository).toBeDefined();
  });

  describe('save', () => {
    it('should save a story domain object', async () => {
      const domain = Story.create({
        name: 'Test Name',
        price: 123,
      });
      const entity = StoryMapper.toPersistence(domain);
      mockTypeormRepository.save.mockResolvedValue(entity);

      const result = await repository.save(domain);

      expect(mockTypeormRepository.save).toHaveBeenCalledWith(entity);
      expect(result.id).toEqual(domain.id);
    });
  });

  describe('findById', () => {
    it('should find a story by id', async () => {
      const entity = new StoryEntity();
      entity.id = 'test-id';
      entity.name = 'Valid Test Name';
      mockTypeormRepository.findOneBy.mockResolvedValue(entity);

      const result = await repository.findById('test-id');

      expect(mockTypeormRepository.findOneBy).toHaveBeenCalledWith({
        id: 'test-id',
      });
      expect(result!.id).toEqual(entity.id);
      expect(result!.name).toEqual(entity.name);
    });
  });
});
