---
to: src/<%= pluralName %>/<%= pluralName %>.module.ts
---
<% ClassName = classifiedName %>
import { Module } from '@nestjs/common';
import { <%= ClassName %>PersistenceModule } from './<%= lowerCaseName %>.persistence.module';
import { <%= pluralClassifiedName %>Controller } from './infrastructure/http/<%= pluralName %>.controller';
import { Create<%= ClassName %>UseCase } from './application/use-cases/create-<%= lowerCaseName %>/create-<%= lowerCaseName %>.use-case';

@Module({
  imports: [<%= classifiedName %>PersistenceModule],
  controllers: [<%= pluralClassifiedName %>Controller],
  providers: [
    Create<%= ClassName %>UseCase,
    // HYGEN-USE-CASE-PROVIDER-ANCHOR (Do not delete this line)
  ],
  exports: [Create<%= ClassName %>UseCase],
})
export class <%= pluralClassifiedName %>Module {}