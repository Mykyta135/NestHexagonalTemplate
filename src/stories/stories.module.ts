import { Module } from '@nestjs/common';
import { StoryPersistenceModule } from './story.persistence.module';
import { StoriesController } from './infrastructure/http/stories.controller';
import { CreateStoryUseCase } from './application/use-cases/create-story/create-story.use-case';

@Module({
  imports: [StoryPersistenceModule],
  controllers: [StoriesController],
  providers: [
    CreateStoryUseCase,
    // HYGEN-USE-CASE-PROVIDER-ANCHOR (Do not delete this line)
  ],
  exports: [CreateStoryUseCase],
})
export class StoriesModule {}
