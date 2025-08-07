---
inject: true
to: src/<%= pluralName %>/application/use-cases/create-<%= singularName %>/create-<%= singularName %>.use-case.ts
before: "// HYGEN-USE-CASE-FACTORY-PROPS-END"
---
      <%= propName %>: command.<%= propName %>,