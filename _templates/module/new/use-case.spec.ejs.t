---
# This template creates the initial, working spec file for the CreateUseCase.
# The 'to:' path points to the exact location of the new test file.
to: src/<%= pluralName %>/application/use-cases/create-<%= lowerCaseName %>/create-<%= lowerCaseName %>.use-case.spec.ts
---
<%
  // Creating simple variables for easy use inside this template
  const classifiedName = h.inflection.classify(name);
  const lowerCaseName = name.toLowerCase();
  const commandClass = `Create${classifiedName}Command`;
  const useCaseClass = `Create${classifiedName}UseCase`;
  const domainClass = classifiedName;
  const testingModuleHelper = `get${classifiedName}TestingModule`;
  const mockRepository = `mock${classifiedName}Repository`;
%>
import { TestingModule } from '@nestjs/testing';
import { <%= testingModuleHelper %>, <%= mockRepository %> } from '../../../<%= lowerCaseName %>.testing.module';
import { <%= useCaseClass %> } from './create-<%= lowerCaseName %>.use-case';
import { <%= commandClass %> } from './create-<%= lowerCaseName %>.command';
import { <%= domainClass %> } from '../../../domain/<%= lowerCaseName %>';

// ... (The rest of your excellent test code remains exactly the same) ...
describe('<%= useCaseClass %>', () => {
  let useCase: <%= useCaseClass %>;
  let module: TestingModule;

  beforeEach(async () => {
    module = await <%= testingModuleHelper %>();
    useCase = module.get<<%= useCaseClass %>>(<%= useCaseClass %>);
  });

  afterEach(async () => {
    jest.clearAllMocks();
    await module.close();
  });

  it('should be defined', () => {
    expect(useCase).toBeDefined();
  });

  describe('execute', () => {
    it('should create a new <%= lowerCaseName %> and save it successfully', async () => {
      // Arrange
      const command = new <%= commandClass %>('Valid Name');
      <%= mockRepository %>.save.mockImplementation(entity => Promise.resolve(entity));

      // Act
      const result = await useCase.execute(command);

      // Assert
      expect(result).toBeInstanceOf(<%= domainClass %>);
      expect(result.name).toBe('Valid Name');
      expect(<%= mockRepository %>.save).toHaveBeenCalledTimes(1);
      expect(<%= mockRepository %>.save).toHaveBeenCalledWith(expect.any(<%= domainClass %>));
    });

    it('should throw an error if the domain validation fails', async () => {
        const commandWithInvalidName = new <%= commandClass %>('a');
        await expect(useCase.execute(commandWithInvalidName)).rejects.toThrow(
            'Name must be at least 2 characters long.',
        );
        expect(<%= mockRepository %>.save).not.toHaveBeenCalled();
    });
  });
});