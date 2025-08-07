---
# This file orchestrates the creation of a full test suite for a module.
actions:
  # Action 1: Create the Controller test file
  - type: add
    path: src/<%= pluralName %>/infrastructure/http/<%= pluralName %>.controller.spec.ts
    # 'templatefile' points to our snippet
    templatefile: controller.spec.ejs.t

  # Action 2: Create the Mapper test file
  - type: add
    path: src/<%= pluralName %>/application/mappers/<%= singularName %>.mapper.spec.ts
    templatefile: mapper.spec.ejs.t

  # Action 3: Create the Repository test file
  - type: add
    path: src/<%= pluralName %>/infrastructure/persistence/typeorm/<%= singularName %>-typeorm.repository.spec.ts
    templatefile: repository.spec.ejs.t
---