---
inject: true
to: src/<%= pluralName %>/<%= pluralName %>.module.ts
before: /@Module/
unless_exists: "import { <%= classifiedUseCase %>UseCase } from"
---
import { <%= classifiedUseCase %>UseCase } from './application/use-cases/<%= useCaseName %>/<%= handlerFileName %>';