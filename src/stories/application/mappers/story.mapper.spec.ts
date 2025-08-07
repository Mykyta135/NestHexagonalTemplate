import { StoryMapper } from './story.mapper';
import { Story } from '../../domain/story';
import { StoryEntity } from '../../infrastructure/persistence/typeorm/story.entity';
import { StoryDto } from '../dto/response/story.dto';

describe('StoryMapper', () => {
  describe('toDomain', () => {
    it('should map an entity to a domain object', () => {
      const entity = new StoryEntity();
      entity.id = 'test-id';
      entity.name = 'Test Name';
      entity.createdAt = new Date();
      entity.updatedAt = new Date();

      const domain = StoryMapper.toDomain(entity);

      expect(domain).toBeInstanceOf(Story);
      expect(domain.id).toEqual(entity.id);
      expect(domain.name).toEqual(entity.name);
    });
  });

  describe('toPersistence', () => {
    it('should map a domain object to a persistence entity', () => {
      const domain = Story.create({
        name: 'Test Name',
        price: 123,
      });
      const entity = StoryMapper.toPersistence(domain);
      expect(entity).toBeInstanceOf(StoryEntity);
      expect(entity.id).toEqual(domain.id);
    });
  });

  describe('toDto', () => {
    it('should map a domain object to a DTO', () => {
      const domain = Story.create({
        name: 'Test Name',
        price: 123,
      });
      const dto = StoryMapper.toDto(domain);
      expect(dto).toBeInstanceOf(StoryDto);
      expect(dto.id).toEqual(domain.id);
    });
  });
});
