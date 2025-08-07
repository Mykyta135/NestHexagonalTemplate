---
to: src/<%= pluralName %>/application/ports/<%= lowerCaseName %>.repository.ts
---
<% ClassName = classifiedName %>
import { <%= ClassName %> } from '../../domain/<%= lowerCaseName %>';

export abstract class <%= ClassName %>Repository {
  abstract findById(id: string): Promise<<%= ClassName %> | null>;
  abstract save(<%= lowerCaseName %>: <%= ClassName %>): Promise<<%= ClassName %>>;
  abstract delete(id: string): Promise<void>;
}