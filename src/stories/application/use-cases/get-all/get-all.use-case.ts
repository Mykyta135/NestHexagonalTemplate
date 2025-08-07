import { Inject, Injectable } from '@nestjs/common';
import { StoryRepository } from '../../ports/story.repository';
import { GetAllCommand } from './get-all.command';
import { Story } from '../../../domain/story';

@Injectable()
export class GetAllUseCase {
  constructor(
    @Inject(StoryRepository)
    private readonly repository: StoryRepository,
  ) {}

  // eslint-disable-next-line  @typescript-eslint/require-await, @typescript-eslint/no-unused-vars
  async execute(command: GetAllCommand): Promise<Story> {
    // TODO: Implement the use case logic.
    // Example for a query: return this.repository.findById(query.id);
    // Example for a command: const story = Story.create(...); await this.repository.save(story);
    throw new Error('Method not implemented.');
  }
}
