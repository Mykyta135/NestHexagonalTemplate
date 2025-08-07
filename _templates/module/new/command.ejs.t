---
to: src/<%= pluralName %>/application/use-cases/create-<%= lowerCaseName %>/create-<%= lowerCaseName %>.command.ts
---
export class Create<%= classifiedName %>Command {
  constructor(
    public readonly name: string,
    // HYGEN-COMMAND-CONSTRUCTOR-ARGS-START

    // HYGEN-COMMAND-CONSTRUCTOR-ARGS-END
  ) {}
}