---
# This file adds the property with its decorators to the DTO.
inject: true
to: src/<%= pluralName %>/application/dto/request/create-<%= singularName %>.dto.ts
before: "// HYGEN-CREATE-DTO-PROPERTY-END"
---

  @ApiProperty({ required: <%= !isOptional %>, description: 'The <%= propName %> of the <%= singularName %>' })
  <%- validators.length > 0 ? validators.join(' ') + ' ' : '' %><%- isOptional ? '@IsOptional() ' : '' %>
  <%= propName %>: <%= propType %><%= isOptional ? ' | null' : '' %>;