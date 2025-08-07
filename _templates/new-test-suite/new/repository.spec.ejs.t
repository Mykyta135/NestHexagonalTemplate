---
# This template's only job is to create the repository test file.
to: src/<%= pluralName %>/infrastructure/persistence/typeorm/<%= singularName %>-typeorm.repository.spec.ts
---
<%
 Singular = classifiedSingular
 Repository = `${Singular}TypeOrmRepository`
%>
import { Test, TestingModule } from '@nestjs/testing';
import { getRepositoryToken } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { <%= Repository %> } from './<%= singularName %>-typeorm.repository';
import { <%= Singular %>Entity } from './<%= singularName %>.entity';
import { <%= Singular %> } from '../../../domain/<%= singularName %>';
import { <%= Singular %>Mapper } from '../../../application/mappers/<%= singularName %>.mapper';

describe('<%= Repository %>', () => {
  let repository: <%= Repository %>;
  // eslint-disable-next-line @typescript-eslint/no-unused-vars
  let typeormRepository: Repository<<%= Singular %>Entity>;

  const mockTypeormRepository = {
    save: jest.fn(),
    findOneBy: jest.fn(),
    delete: jest.fn(),
  };

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [
        <%= Repository %>,
        {
          provide: getRepositoryToken(<%= Singular %>Entity),
          useValue: mockTypeormRepository,
        },
      ],
    }).compile();

    repository = module.get<<%= Repository %>>(<%= Repository %>);
    typeormRepository = module.get<Repository<<%= Singular %>Entity>>(
      getRepositoryToken(<%= Singular %>Entity),
    );
  });
  
  afterEach(() => {
    jest.clearAllMocks();
  });

  it('should be defined', () => {
    expect(repository).toBeDefined();
  });

  describe('save', () => {
    it('should save a <%= singularName %> domain object', async () => {
      const domain = <%= Singular %>.create({ 
        <%- mockCreateProps %> 
      });
      const entity = <%= Singular %>Mapper.toPersistence(domain);
      mockTypeormRepository.save.mockResolvedValue(entity);

      const result = await repository.save(domain);

      expect(mockTypeormRepository.save).toHaveBeenCalledWith(entity);
      expect(result.id).toEqual(domain.id);
    });
  });
  
  describe('findById', () => {
    it('should find a <%= singularName %> by id', async () => {
      const entity = new <%= Singular %>Entity();
      entity.id = 'test-id';
      entity.name = 'Valid Test Name';
      mockTypeormRepository.findOneBy.mockResolvedValue(entity);

      const result = await repository.findById('test-id');

      expect(mockTypeormRepository.findOneBy).toHaveBeenCalledWith({ id: 'test-id' });
      expect(result!.id).toEqual(entity.id);
      expect(result!.name).toEqual(entity.name);
    });
  });
});