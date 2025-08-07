import { ApiProperty } from '@nestjs/swagger';
export class StoryDto {
  @ApiProperty() id: string;
  @ApiProperty() name: string;
  // HYGEN-RESPONSE-DTO-PROPERTY-START

  @ApiProperty({ description: 'The price of the story' })
  price: number | null;
  // HYGEN-RESPONSE-DTO-PROPERTY-END
  @ApiProperty() createdAt: Date;
  @ApiProperty() updatedAt: Date;
}
