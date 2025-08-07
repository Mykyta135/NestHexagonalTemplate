---
inject: true
to: src/<%= pluralName %>/domain/<%= singularName %>.ts
before: "// HYGEN-DOMAIN-CONSTRUCTOR-BODY-END"
---
    this.<%= propName %> = props.<%= propName %>;