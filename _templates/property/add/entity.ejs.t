---
inject: true
to: src/<%= pluralName %>/infrastructure/persistence/typeorm/<%= singularName %>.entity.ts
before: "// HYGEN-ENTITY-PROPERTY-END"
---

  @Column({ type: '<%= propType.toLowerCase() === 'date' ? 'timestamp' : propType.toLowerCase() %>', unique: <%= isUnique %>, nullable: <%= isOptional %> })
  <%= propName %>: <%= propType %><%= isOptional ? ' | null' : '' %>;