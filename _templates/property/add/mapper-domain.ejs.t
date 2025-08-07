---
inject: true
to: src/<%= pluralName %>/application/mappers/<%= singularName %>.mapper.ts
before: "// HYGEN-MAPPER-TO-DOMAIN-FACTORY-PROPS-END"
---
      <%= propName %>: entity.<%= propName %>,