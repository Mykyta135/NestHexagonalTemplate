---
inject: true
to: src/<%= pluralName %>/application/dto/response/<%= singularName %>.dto.ts
before: "// HYGEN-RESPONSE-DTO-PROPERTY-END"
---

  @ApiProperty({ description: 'The <%= propName %> of the <%= singularName %>' })
  <%= propName %>: <%= propType %><%= isOptional ? ' | null' : '' %>;