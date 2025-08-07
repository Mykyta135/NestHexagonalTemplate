---
to: src/<%= pluralName %>/domain/<%= lowerCaseName %>.ts
---
<% ClassName = classifiedName %>
import { randomUUID } from 'crypto';

export class <%= ClassName %> {
  id: string;
  name: string;
  // HYGEN-DOMAIN-PROPERTY-START

  // HYGEN-DOMAIN-PROPERTY-END
  createdAt: Date;
  updatedAt: Date;

  private constructor(props: {
    id?: string;
    name: string;
    
    // HYGEN-DOMAIN-CONSTRUCTOR-PROPS-START

    // HYGEN-DOMAIN-CONSTRUCTOR-PROPS-END
  }) {
    this.id = props.id ?? randomUUID();
    this.name = props.name;
    // HYGEN-DOMAIN-CONSTRUCTOR-BODY-START

    // HYGEN-DOMAIN-CONSTRUCTOR-BODY-END
  }

  public static create(props: {
    name: string;
    // HYGEN-DOMAIN-FACTORY-PROPS-START

    // HYGEN-DOMAIN-FACTORY-PROPS-END
  }): <%= ClassName %> {
    if (!props.name || props.name.length < 2) {
      throw new Error('Name must be at least 2 characters long.');
    }
    const allProps = { ...props };
    return new <%= ClassName %>(allProps);
  }
}