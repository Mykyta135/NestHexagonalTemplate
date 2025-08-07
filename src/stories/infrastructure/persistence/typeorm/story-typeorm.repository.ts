import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { StoryRepository } from '../../../application/ports/story.repository';
import { StoryEntity } from './story.entity';
import { Story } from '../../../domain/story';
import { StoryMapper } from '../../../application/mappers/story.mapper';

@Injectable()
export class StoryTypeOrmRepository implements StoryRepository {
  constructor(
    @InjectRepository(StoryEntity)
    private readonly repo: Repository<StoryEntity>,
  ) {}

  async findById(id: string): Promise<Story | null> {
    const entity = await this.repo.findOneBy({ id });
    return entity ? StoryMapper.toDomain(entity) : null;
  }

  async save(story: Story): Promise<Story> {
    const entity = StoryMapper.toPersistence(story);
    const newEntity = await this.repo.save(entity);
    return StoryMapper.toDomain(newEntity);
  }

  async delete(id: string): Promise<void> {
    await this.repo.delete(id);
  }
}
