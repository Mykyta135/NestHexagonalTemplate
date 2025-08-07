import { ApiProperty } from '@nestjs/swagger';
import {
  IsNotEmpty,
  IsNumber,
  IsOptional,
  IsString,
  MinLength,
  // HYGEN-VALIDATOR-IMPORTS (Do not delete this line)
} from 'class-validator';

export class CreateStoryDto {
  @ApiProperty({ example: 'Example Story', minLength: 2 })
  @IsString()
  @IsNotEmpty()
  @MinLength(2)
  name: string;
  // HYGEN-CREATE-DTO-PROPERTY-START

  @ApiProperty({ required: false, description: 'The price of the story' })
  @IsNotEmpty()
  @IsNumber()
  @IsOptional()
  price: number | null;
  // HYGEN-CREATE-DTO-PROPERTY-END
}
