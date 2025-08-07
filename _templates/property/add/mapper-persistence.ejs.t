---
inject: true
to: src/<%= pluralName %>/application/mappers/<%= singularName %>.mapper.ts
before: "// HYGEN-MAPPER-TO-PERSISTENCE-END"
---
    entity.<%= propName %> = domain.<%= propName %>;