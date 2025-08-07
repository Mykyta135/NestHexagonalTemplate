---
# This template's only job is to create the controller test file.
to: src/<%= pluralName %>/infrastructure/http/<%= pluralName %>.controller.spec.ts
---
<%
 Singular = classifiedSingular
 Plural = pluralClassified
%>
import { Test, TestingModule } from '@nestjs/testing';
import { <%= Plural %>Controller } from './<%= pluralName %>.controller';
import { Create<%= Singular %>UseCase } from '../../application/use-cases/create-<%= singularName %>/create-<%= singularName %>.use-case';
import { Create<%= Singular %>Dto } from '../../application/dto/request/create-<%= singularName %>.dto';
import { Create<%= Singular %>Command } from '../../application/use-cases/create-<%= singularName %>/create-<%= singularName %>.command';
import { <%= Singular %> } from '../../domain/<%= singularName %>';
import { <%= Singular %>Mapper } from '../../application/mappers/<%= singularName %>.mapper';

describe('<%= Plural %>Controller', () => {
  let controller: <%= Plural %>Controller;

  // Mock all use cases injected into the controller
  const mockCreate<%= Singular %>UseCase = {
    execute: jest.fn(),
  };

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      controllers: [<%= Plural %>Controller],
      providers: [
        {
          provide: Create<%= Singular %>UseCase,
          useValue: mockCreate<%= Singular %>UseCase,
        },
      ],
    }).compile();

    controller = module.get<<%= Plural %>Controller>(<%= Plural %>Controller);
  });

  afterEach(() => {
    jest.clearAllMocks();
  });

  it('should be defined', () => {
    expect(controller).toBeDefined();
  });

   describe('create', () => {
    it('should create a new <%= singularName %> and return it as a DTO', async () => {
      const createDto: Create<%= Singular %>Dto = { <%- mockDtoProps %> };
      const domain<%= Singular %> = <%= Singular %>.create({
        <%- mockCreateProps %>
      });
      mockCreate<%= Singular %>UseCase.execute.mockResolvedValue(domain<%= Singular %>);

      const result = await controller.create(createDto);

      expect(mockCreate<%= Singular %>UseCase.execute).toHaveBeenCalledWith(
        expect.any(Create<%= Singular %>Command)
      );
      const expectedDto = <%= Singular %>Mapper.toDto(domain<%= Singular %>);
      expect(result).toEqual(expectedDto);
    });
  });
});