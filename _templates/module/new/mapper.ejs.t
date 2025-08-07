---
to: src/<%= pluralName %>/application/mappers/<%= lowerCaseName %>.mapper.ts
---
<% ClassName = classifiedName %>
import { <%= ClassName %> } from '../../domain/<%= lowerCaseName %>';
import { <%= ClassName %>Entity } from '../../infrastructure/persistence/typeorm/<%= lowerCaseName %>.entity';
import { <%= ClassName %>Dto } from '../dto/response/<%= lowerCaseName %>.dto';

export class <%= ClassName %>Mapper {
  static toDomain(entity: <%= ClassName %>Entity): <%= ClassName %> {
    const domain = <%= ClassName %>.create({
      name: entity.name,
      // HYGEN-MAPPER-TO-DOMAIN-FACTORY-PROPS-START

      // HYGEN-MAPPER-TO-DOMAIN-FACTORY-PROPS-END
    });
    domain.id = entity.id;
    domain.createdAt = entity.createdAt;
    domain.updatedAt = entity.updatedAt;
    return domain;
  }

  static toPersistence(domain: <%= ClassName %>): <%= ClassName %>Entity {
    const entity = new <%= ClassName %>Entity();
    entity.id = domain.id;
    entity.name = domain.name;
    // HYGEN-MAPPER-TO-PERSISTENCE-START

    // HYGEN-MAPPER-TO-PERSISTENCE-END
    entity.createdAt = domain.createdAt;
    entity.updatedAt = domain.updatedAt;
    return entity;
  }

  static toDto(domain: <%= ClassName %>): <%= ClassName %>Dto {
    const dto = new <%= ClassName %>Dto();
    dto.id = domain.id;
    dto.name = domain.name;
    // HYGEN-MAPPER-TO-DTO-START

    // HYGEN-MAPPER-TO-DTO-END
    dto.createdAt = domain.createdAt;
    dto.updatedAt = domain.updatedAt;
    return dto;
  }
}