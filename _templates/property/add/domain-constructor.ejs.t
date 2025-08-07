---
inject: true
to: src/<%= pluralName %>/domain/<%= singularName %>.ts
before: "// HYGEN-DOMAIN-CONSTRUCTOR-PROPS-END"
---
    <%= propName %>: <%= propType %><%= isOptional ? ' | null' : '' %>;