---
to: src/<%= pluralName %>/<%= singularName %>.testing.module.ts
---
import { Test, TestingModule } from '@nestjs/testing';
import { <%= classifiedName %>Repository } from './application/ports/<%= lowerCaseName %>.repository';
import { Create<%= classifiedName %>UseCase } from './application/use-cases/create-<%= lowerCaseName %>/create-<%= lowerCaseName %>.use-case';
// HYGEN-TESTING-MODULE-IMPORT-ANCHOR

// Dynamically generated mock for the repository
export const mock<%= classifiedName %>Repository = {
<% repositoryMethods.forEach(method => { -%>
  <%= method %>: jest.fn(),
<% }); -%>
  // HYGEN-TESTING-MOCK-REPOSITORY-ANCHOR
};

export const get<%= classifiedName %>TestingModule = async (): Promise<TestingModule> => {
  return await Test.createTestingModule({
    providers: [
      {
        provide: <%= classifiedName %>Repository,
        useValue: mock<%= classifiedName %>Repository,
      },
      Create<%= classifiedName %>UseCase,
      // HYGEN-TESTING-MODULE-PROVIDER-ANCHOR
    ],
  }).compile();
};