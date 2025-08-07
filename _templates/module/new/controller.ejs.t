---
to: src/<%= pluralName %>/infrastructure/http/<%= pluralName %>.controller.ts
---
<% ClassName = classifiedName %>
import { Body, Controller, Post, HttpStatus } from '@nestjs/common';
import { ApiTags, ApiOperation, ApiResponse } from '@nestjs/swagger';
import { Create<%= ClassName %>UseCase } from '../../application/use-cases/create-<%= lowerCaseName %>/create-<%= lowerCaseName %>.use-case';
import { Create<%= ClassName %>Dto } from '../../application/dto/request/create-<%= lowerCaseName %>.dto';
import { Create<%= ClassName %>Command } from '../../application/use-cases/create-<%= lowerCaseName %>/create-<%= lowerCaseName %>.command';
import { <%= ClassName %>Dto } from '../../application/dto/response/<%= lowerCaseName %>.dto';
import { <%= ClassName %>Mapper } from '../../application/mappers/<%= lowerCaseName %>.mapper';

@ApiTags('<%= pluralClassifiedName %>')
@Controller('<%= pluralName %>')
export class <%= pluralClassifiedName %>Controller {
  constructor(private readonly create<%= ClassName %>UseCase: Create<%= ClassName %>UseCase) {}

  @Post()
  @ApiOperation({ summary: 'Create a new <%= lowerCaseName %>' })
  @ApiResponse({ status: HttpStatus.CREATED, type: <%= ClassName %>Dto })
  async create(@Body() createDto: Create<%= ClassName %>Dto): Promise<<%= ClassName %>Dto> {
    const command = new Create<%= ClassName %>Command(
      createDto.name,
      // HYGEN-CONTROLLER-COMMAND-ARGS-START

      // HYGEN-CONTROLLER-COMMAND-ARGS-END
    );
    const result = await this.create<%= ClassName %>UseCase.execute(command);
    return <%= ClassName %>Mapper.toDto(result);
  }
}