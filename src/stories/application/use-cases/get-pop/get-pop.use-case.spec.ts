import { Test, TestingModule } from '@nestjs/testing';
import { GetPopUseCase } from './get-pop.use-case';
import { StoryRepository } from '../../ports/story.repository';
// Import the domain and command/query to instantiate them
import { GetPopCommand } from './get-pop.command';

// Mock implementation for the repository
const mockStoryRepository = {
  save: jest.fn(),
  findById: jest.fn(),
};

describe('GetPopUseCase', () => {
  let useCase: GetPopUseCase;
  let repository: StoryRepository;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [
        GetPopUseCase,
        {
          provide: StoryRepository,
          useValue: mockStoryRepository,
        },
      ],
    }).compile();

    useCase = module.get<GetPopUseCase>(GetPopUseCase);
    repository = module.get<StoryRepository>(StoryRepository);
  });

  afterEach(() => {
    jest.clearAllMocks();
  });

  it('should be defined', () => {
    expect(useCase).toBeDefined();
  });

  describe('execute command', () => {
    it('should successfully execute the command', async () => {
      // Arrange
      const command = new GetPopCommand('Test Name', 123);

      // VVVV THIS IS THE FIX VVVV
      // Mock the repository to simply return whatever entity it's given.
      // This simulates a successful database save.
      (repository.save as jest.Mock).mockImplementation((domainEntity) =>
        Promise.resolve(domainEntity),
      );
      // ^^^^ THIS IS THE FIX ^^^^

      // Act
      const result = await useCase.execute(command);

      // Assert
      expect(repository.save).toHaveBeenCalled();
      expect(result.name).toBe('Test Name'); // Example assertion
    });
  });
});
