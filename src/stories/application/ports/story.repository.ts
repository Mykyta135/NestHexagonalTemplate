import { Story } from '../../domain/story';

export abstract class StoryRepository {
  abstract findById(id: string): Promise<Story | null>;
  abstract save(story: Story): Promise<Story>;
  abstract delete(id: string): Promise<void>;
}
