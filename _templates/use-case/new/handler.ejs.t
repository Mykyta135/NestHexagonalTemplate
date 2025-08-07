---
to: src/<%= pluralName %>/application/use-cases/<%= useCaseName %>/<%= handlerFileName %>.ts
---
import { Inject, Injectable } from '@nestjs/common';
import { <%= classifiedSingular %>Repository } from '../../ports/<%= singularName %>.repository';
import { <%= classifiedUseCase %><%= useCaseType %> } from './<%= useCaseFileName %>';
<% if (returnType && returnType !== 'void') {
  // Get the base type, e.g., 'Story' from 'Story | null' or 'Story[]'
  const baseReturnType = returnType.replace(/\[\]| |null/g, '');
-%>
import { <%= baseReturnType %> } from '../../../domain/<%= singularName %>';
<% } -%>

@Injectable()
export class <%= classifiedUseCase %>UseCase {
  constructor(
    @Inject(<%= classifiedSingular %>Repository)
    private readonly repository: <%= classifiedSingular %>Repository,
  ) {}

  // eslint-disable-next-line  @typescript-eslint/no-unused-vars, @typescript-eslint/require-await
  async execute(
    <%= useCaseType.toLowerCase() %>: <%= classifiedUseCase %><%= useCaseType %>,
  ): Promise<<%- returnType %>> {
    // TODO: Implement the use case logic.
    // Example for a query: return this.repository.findById(query.id);
    // Example for a command: const story = Story.create(...); await this.repository.save(story);
    throw new Error('Method not implemented.');
  }
}