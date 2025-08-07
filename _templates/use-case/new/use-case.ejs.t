---
to: src/<%= pluralName %>/application/use-cases/<%= useCaseName %>/<%= handlerFileName %>.spec.ts
---
import { Test, TestingModule } from '@nestjs/testing';
import { <%= classifiedUseCase %>UseCase } from './<%= handlerFileName %>';
import { <%= classifiedSingular %>Repository } from '../../ports/<%= singularName %>.repository';
// Import the domain and command/query to instantiate them
import { <%= classifiedSingular %> } from '../../../domain/<%= singularName %>';
import { <%= classifiedUseCase %><%= useCaseType %> } from './<%= useCaseFileName %>';

// Mock implementation for the repository
const mock<%= classifiedSingular %>Repository = {
  save: jest.fn(),
  findById: jest.fn(),
};

describe('<%= classifiedUseCase %>UseCase', () => {
  let useCase: <%= classifiedUseCase %>UseCase;
  let repository: <%= classifiedSingular %>Repository;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [
        <%= classifiedUseCase %>UseCase,
        {
          provide: <%= classifiedSingular %>Repository,
          useValue: mock<%= classifiedSingular %>Repository,
        },
      ],
    }).compile();

    useCase = module.get<<%= classifiedUseCase %>UseCase>(<%= classifiedUseCase %>UseCase);
    repository = module.get<<%= classifiedSingular %>Repository>(<%= classifiedSingular %>Repository);
  });
  
  afterEach(() => {
    jest.clearAllMocks();
  });

  it('should be defined', () => {
    expect(useCase).toBeDefined();
  });

  <% if (useCaseType === 'Command') { %>
  describe('execute command', () => {
    it('should successfully execute the command', async () => {
      // Arrange
      const command = new <%= classifiedUseCase %>Command(<%- mockCommandArgs %>);
      
      // VVVV THIS IS THE FIX VVVV
      // Mock the repository to simply return whatever entity it's given.
      // This simulates a successful database save.
      (repository.save as jest.Mock).mockImplementation(domainEntity => Promise.resolve(domainEntity));
      // ^^^^ THIS IS THE FIX ^^^^

      // Act
      const result = await useCase.execute(command);

      // Assert
      expect(repository.save).toHaveBeenCalled();
      expect(result.name).toBe('Test Name'); // Example assertion
    });
  });
  <% } %>

  <% if (useCaseType === 'Query') { %>
  describe('execute query', () => {
    it('should successfully execute the query', async () => {
      // Arrange
      const query = new <%= classifiedUseCase %>Query();
      // VVVV THIS IS THE FIX VVVV
      // Create a mock domain entity to be returned by the repository.
      const mockDomainEntity = <%= classifiedSingular %>.create({ <%- mockCreateProps %> });
      (repository.findById as jest.Mock).mockResolvedValue(mockDomainEntity);
      // ^^^^ THIS IS THE FIX ^^^^

      // Act
      const result = await useCase.execute(query);

      // Assert
      expect(repository.findById).toHaveBeenCalled();
      expect(result).toEqual(mockDomainEntity);
    });
  });
  <% } %>
});