import { Inject, Injectable } from '@nestjs/common';
import { StoryRepository } from '../../ports/story.repository';
import { GetPopCommand } from './get-pop.command';
import { Story } from '../../../domain/story';

@Injectable()
export class GetPopUseCase {
  constructor(
    @Inject(StoryRepository)
    private readonly repository: StoryRepository,
  ) {}

  // eslint-disable-next-line  @typescript-eslint/require-await, @typescript-eslint/no-unused-vars
  async execute(command: GetPopCommand): Promise<Story> {
    // TODO: Implement the use case logic.
    // Example for a query: return this.repository.findById(query.id);
    // Example for a command: const story = Story.create(...); await this.repository.save(story);
    throw new Error('Method not implemented.');
  }
}
