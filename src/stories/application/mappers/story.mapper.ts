import { Story } from '../../domain/story';
import { StoryEntity } from '../../infrastructure/persistence/typeorm/story.entity';
import { StoryDto } from '../dto/response/story.dto';

export class StoryMapper {
  static toDomain(entity: StoryEntity): Story {
    const domain = Story.create({
      name: entity.name,
      // HYGEN-MAPPER-TO-DOMAIN-FACTORY-PROPS-START

      price: entity.price,
      // HYGEN-MAPPER-TO-DOMAIN-FACTORY-PROPS-END
    });
    domain.id = entity.id;
    domain.createdAt = entity.createdAt;
    domain.updatedAt = entity.updatedAt;
    return domain;
  }

  static toPersistence(domain: Story): StoryEntity {
    const entity = new StoryEntity();
    entity.id = domain.id;
    entity.name = domain.name;
    // HYGEN-MAPPER-TO-PERSISTENCE-START

    entity.price = domain.price;
    // HYGEN-MAPPER-TO-PERSISTENCE-END
    entity.createdAt = domain.createdAt;
    entity.updatedAt = domain.updatedAt;
    return entity;
  }

  static toDto(domain: Story): StoryDto {
    const dto = new StoryDto();
    dto.id = domain.id;
    dto.name = domain.name;
    // HYGEN-MAPPER-TO-DTO-START

    dto.price = domain.price;
    // HYGEN-MAPPER-TO-DTO-END
    dto.createdAt = domain.createdAt;
    dto.updatedAt = domain.updatedAt;
    return dto;
  }
}
