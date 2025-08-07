---
# This template creates the data class for the Command or Query.
to: src/<%= pluralName %>/application/use-cases/<%= useCaseName %>/<%= useCaseFileName %>.ts
---
// TODO: Add constructor arguments if this use case requires parameters.
// Example: public readonly id: string
export class <%= classifiedUseCase %><%= useCaseType %> {
  constructor(...args: any[]) {}
}