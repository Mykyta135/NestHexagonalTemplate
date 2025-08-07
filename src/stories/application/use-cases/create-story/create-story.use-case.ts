import { Inject, Injectable } from '@nestjs/common';
import { StoryRepository } from '../../ports/story.repository';
import { CreateStoryCommand } from './create-story.command';
import { Story } from '../../../domain/story';

@Injectable()
export class CreateStoryUseCase {
  constructor(
    @Inject(StoryRepository) private readonly repository: StoryRepository,
  ) {}

  async execute(command: CreateStoryCommand): Promise<Story> {
    const story = Story.create({
      name: command.name,
      // HYGEN-USE-CASE-FACTORY-PROPS-START

      price: command.price,
      // HYGEN-USE-CASE-FACTORY-PROPS-END
    });
    return this.repository.save(story);
  }
}
