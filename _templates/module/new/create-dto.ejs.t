---
to: src/<%= pluralName %>/application/dto/request/create-<%= lowerCaseName %>.dto.ts
---
import { ApiProperty } from '@nestjs/swagger';
import { 
  IsNotEmpty, 
  IsString, 
  MinLength,
  // HYGEN-VALIDATOR-IMPORTS (Do not delete this line)
} from 'class-validator';

export class Create<%= classifiedName %>Dto {
  @ApiProperty({ example: 'Example <%= classifiedName %>', minLength: 2 })
  @IsString() @IsNotEmpty() @MinLength(2)
  name: string;
  // HYGEN-CREATE-DTO-PROPERTY-START

  // HYGEN-CREATE-DTO-PROPERTY-END
}