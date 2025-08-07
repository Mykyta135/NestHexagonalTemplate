---
inject: true
to: src/<%= pluralName %>/domain/<%= singularName %>.ts
before: "// HYGEN-DOMAIN-PROPERTY-END"
---
  <%= propName %>: <%= propType %><%= isOptional ? ' | null' : '' %>;