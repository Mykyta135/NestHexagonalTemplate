export class CreateStoryCommand {
  constructor(
    public readonly name: string,
    // HYGEN-COMMAND-CONSTRUCTOR-ARGS-START

    public readonly price: number | null,
    // HYGEN-COMMAND-CONSTRUCTOR-ARGS-END
  ) {}
}
