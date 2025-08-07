import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
// HYGEN-IMPORT-ANCHOR (Do not delete this line)

@Module({
  imports: [
    // HYGEN-IMPORTS-ARRAY-ANCHOR (Do not delete this line)
  ],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
