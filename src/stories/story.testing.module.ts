import { Test, TestingModule } from '@nestjs/testing';
import { StoryRepository } from './application/ports/story.repository';
import { CreateStoryUseCase } from './application/use-cases/create-story/create-story.use-case';
// HYGEN-TESTING-MODULE-IMPORT-ANCHOR

// Dynamically generated mock for the repository
export const mockStoryRepository = {
  save: jest.fn(),
  // HYGEN-TESTING-MOCK-REPOSITORY-ANCHOR
};

export const getStoryTestingModule = async (): Promise<TestingModule> => {
  return await Test.createTestingModule({
    providers: [
      {
        provide: StoryRepository,
        useValue: mockStoryRepository,
      },
      CreateStoryUseCase,
      // HYGEN-TESTING-MODULE-PROVIDER-ANCHOR
    ],
  }).compile();
};
