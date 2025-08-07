---
inject: true
to: src/<%= pluralName %>/application/mappers/<%= singularName %>.mapper.ts
before: "// HYGEN-MAPPER-TO-DTO-END"
---
    dto.<%= propName %> = domain.<%= propName %>;