import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { StoryRepository } from './application/ports/story.repository';
import { StoryTypeOrmRepository } from './infrastructure/persistence/typeorm/story-typeorm.repository';
import { StoryEntity } from './infrastructure/persistence/typeorm/story.entity';

@Module({
  imports: [TypeOrmModule.forFeature([StoryEntity])],
  providers: [{ provide: StoryRepository, useClass: StoryTypeOrmRepository }],
  exports: [StoryRepository],
})
export class StoryPersistenceModule {}
