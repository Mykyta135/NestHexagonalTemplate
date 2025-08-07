import { Test, TestingModule } from '@nestjs/testing';
import { StoriesController } from './stories.controller';
import { CreateStoryUseCase } from '../../application/use-cases/create-story/create-story.use-case';
import { CreateStoryDto } from '../../application/dto/request/create-story.dto';
import { CreateStoryCommand } from '../../application/use-cases/create-story/create-story.command';
import { Story } from '../../domain/story';
import { StoryMapper } from '../../application/mappers/story.mapper';

describe('StoriesController', () => {
  let controller: StoriesController;

  // Mock all use cases injected into the controller
  const mockCreateStoryUseCase = {
    execute: jest.fn(),
  };

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      controllers: [StoriesController],
      providers: [
        {
          provide: CreateStoryUseCase,
          useValue: mockCreateStoryUseCase,
        },
      ],
    }).compile();

    controller = module.get<StoriesController>(StoriesController);
  });

  afterEach(() => {
    jest.clearAllMocks();
  });

  it('should be defined', () => {
    expect(controller).toBeDefined();
  });

  describe('create', () => {
    it('should create a new story and return it as a DTO', async () => {
      const createDto: CreateStoryDto = { name: 'Test Name', price: 123 };
      const domainStory = Story.create({
        name: 'Test Name',
        price: 123,
      });
      mockCreateStoryUseCase.execute.mockResolvedValue(domainStory);

      const result = await controller.create(createDto);

      expect(mockCreateStoryUseCase.execute).toHaveBeenCalledWith(
        expect.any(CreateStoryCommand),
      );
      const expectedDto = StoryMapper.toDto(domainStory);
      expect(result).toEqual(expectedDto);
    });
  });
});
