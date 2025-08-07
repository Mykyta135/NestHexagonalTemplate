import { randomUUID } from 'crypto';

export class Story {
  id: string;
  name: string;
  // HYGEN-DOMAIN-PROPERTY-START

  price: number | null;
  // HYGEN-DOMAIN-PROPERTY-END
  createdAt: Date;
  updatedAt: Date;

  private constructor(props: {
    id?: string;
    name: string;

    // HYGEN-DOMAIN-CONSTRUCTOR-PROPS-START

    price: number | null;
    // HYGEN-DOMAIN-CONSTRUCTOR-PROPS-END
  }) {
    this.id = props.id ?? randomUUID();
    this.name = props.name;
    // HYGEN-DOMAIN-CONSTRUCTOR-BODY-START

    this.price = props.price;
    // HYGEN-DOMAIN-CONSTRUCTOR-BODY-END
  }

  public static create(props: {
    name: string;
    // HYGEN-DOMAIN-FACTORY-PROPS-START

    price: number | null;
    // HYGEN-DOMAIN-FACTORY-PROPS-END
  }): Story {
    if (!props.name || props.name.length < 2) {
      throw new Error('Name must be at least 2 characters long.');
    }
    const allProps = { ...props };
    return new Story(allProps);
  }
}
