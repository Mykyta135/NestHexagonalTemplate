---
# This template ONLY adds validator imports, and ONLY if needed.
# The 'if' condition checks if the validatorImports array has items.
if: <%= validatorImports && validatorImports.length > 0 %>
inject: true
to: src/<%= pluralName %>/application/dto/request/create-<%= singularName %>.dto.ts
before: "// HYGEN-VALIDATOR-IMPORTS (Do not delete this line)"
---
<%- validatorImports.join(',\n  ') %>,