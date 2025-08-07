---
inject: true
to: src/<%= pluralName %>/infrastructure/http/<%= pluralName %>.controller.ts
before: "// HYGEN-CONTROLLER-COMMAND-ARGS-END"
---
      createDto.<%= propName %>,