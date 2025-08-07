---
inject: true
to: src/<%= pluralName %>/domain/<%= singularName %>.ts
before: "// HYGEN-DOMAIN-FACTORY-PROPS-END"
---
    <%= propName %>: <%= propType %><%= isOptional ? ' | null' : '' %>,