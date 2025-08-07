---
to: src/<%= pluralName %>/<%= lowerCaseName %>.persistence.module.ts
---
<% ClassName = classifiedName %>
import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { <%= ClassName %>Repository } from './application/ports/<%= lowerCaseName %>.repository';
import { <%= ClassName %>TypeOrmRepository } from './infrastructure/persistence/typeorm/<%= lowerCaseName %>-typeorm.repository';
import { <%= ClassName %>Entity } from './infrastructure/persistence/typeorm/<%= lowerCaseName %>.entity';

@Module({
  imports: [TypeOrmModule.forFeature([<%= ClassName %>Entity])],
  providers: [{ provide: <%= ClassName %>Repository, useClass: <%= ClassName %>TypeOrmRepository }],
  exports: [<%= ClassName %>Repository],
})
export class <%= ClassName %>PersistenceModule {}