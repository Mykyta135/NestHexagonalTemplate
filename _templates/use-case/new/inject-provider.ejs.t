---
inject: true
to: src/<%= pluralName %>/<%= pluralName %>.module.ts
before: "// HYGEN-USE-CASE-PROVIDER-ANCHOR (Do not delete this line)"
unless_exists: "<%= classifiedUseCase %>UseCase"
---
    <%= classifiedUseCase %>UseCase,