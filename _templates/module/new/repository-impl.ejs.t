---
to: src/<%= pluralName %>/infrastructure/persistence/typeorm/<%= lowerCaseName %>-typeorm.repository.ts
---
<% ClassName = classifiedName %>
import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { <%= ClassName %>Repository } from '../../../application/ports/<%= lowerCaseName %>.repository';
import { <%= ClassName %>Entity } from './<%= lowerCaseName %>.entity';
import { <%= ClassName %> } from '../../../domain/<%= lowerCaseName %>';
import { <%= ClassName %>Mapper } from '../../../application/mappers/<%= lowerCaseName %>.mapper';

@Injectable()
export class <%= ClassName %>TypeOrmRepository implements <%= ClassName %>Repository {
  constructor(@InjectRepository(<%= ClassName %>Entity) private readonly repo: Repository<<%= ClassName %>Entity>) {}

  async findById(id: string): Promise<<%= ClassName %> | null> {
    const entity = await this.repo.findOneBy({ id });
    return entity ? <%= ClassName %>Mapper.toDomain(entity) : null;
  }

  async save(<%= lowerCaseName %>: <%= ClassName %>): Promise<<%= ClassName %>> {
    const entity = <%= ClassName %>Mapper.toPersistence(<%= lowerCaseName %>);
    const newEntity = await this.repo.save(entity);
    return <%= ClassName %>Mapper.toDomain(newEntity);
  }

  async delete(id: string): Promise<void> {
    await this.repo.delete(id);
  }
}