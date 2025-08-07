---
to: src/<%= pluralName %>/application/use-cases/create-<%= lowerCaseName %>/create-<%= lowerCaseName %>.use-case.ts
---
<% ClassName = classifiedName %>
import { Inject, Injectable } from '@nestjs/common';
import { <%= ClassName %>Repository } from '../../ports/<%= lowerCaseName %>.repository';
import { Create<%= ClassName %>Command } from './create-<%= lowerCaseName %>.command';
import { <%= ClassName %> } from '../../../domain/<%= lowerCaseName %>';

@Injectable()
export class Create<%= ClassName %>UseCase {
  constructor(@Inject(<%= ClassName %>Repository) private readonly repository: <%= ClassName %>Repository) {}

  async execute(command: Create<%= ClassName %>Command): Promise<<%= ClassName %>> {
    const <%= lowerCaseName %> = <%= ClassName %>.create({
      name: command.name,
      // HYGEN-USE-CASE-FACTORY-PROPS-START

      // HYGEN-USE-CASE-FACTORY-PROPS-END
    });
    return this.repository.save(<%= lowerCaseName %>);
  }
}