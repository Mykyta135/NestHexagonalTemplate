---
to: src/<%= pluralName %>/application/dto/response/<%= lowerCaseName %>.dto.ts
---
import { ApiProperty } from '@nestjs/swagger';
export class <%= classifiedName %>Dto {
  @ApiProperty() id: string;
  @ApiProperty() name: string;
  // HYGEN-RESPONSE-DTO-PROPERTY-START

  // HYGEN-RESPONSE-DTO-PROPERTY-END
  @ApiProperty() createdAt: Date;
  @ApiProperty() updatedAt: Date;
}