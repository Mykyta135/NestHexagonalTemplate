import { Body, Controller, Post, HttpStatus } from '@nestjs/common';
import { ApiTags, ApiOperation, ApiResponse } from '@nestjs/swagger';
import { CreateStoryUseCase } from '../../application/use-cases/create-story/create-story.use-case';
import { CreateStoryDto } from '../../application/dto/request/create-story.dto';
import { CreateStoryCommand } from '../../application/use-cases/create-story/create-story.command';
import { StoryDto } from '../../application/dto/response/story.dto';
import { StoryMapper } from '../../application/mappers/story.mapper';

@ApiTags('Stories')
@Controller('stories')
export class StoriesController {
  constructor(private readonly createStoryUseCase: CreateStoryUseCase) {}

  @Post()
  @ApiOperation({ summary: 'Create a new story' })
  @ApiResponse({ status: HttpStatus.CREATED, type: StoryDto })
  async create(@Body() createDto: CreateStoryDto): Promise<StoryDto> {
    const command = new CreateStoryCommand(
      createDto.name,
      // HYGEN-CONTROLLER-COMMAND-ARGS-START

      createDto.price,
      // HYGEN-CONTROLLER-COMMAND-ARGS-END
    );
    const result = await this.createStoryUseCase.execute(command);
    return StoryMapper.toDto(result);
  }
}
