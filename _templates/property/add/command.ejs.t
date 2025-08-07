---
inject: true
to: src/<%= pluralName %>/application/use-cases/create-<%= singularName %>/create-<%= singularName %>.command.ts
before: "// HYGEN-COMMAND-CONSTRUCTOR-ARGS-END"
---
    public readonly <%= propName %>: <%= propType %><%= isOptional ? ' | null' : '' %>,