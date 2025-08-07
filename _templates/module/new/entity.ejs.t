---
to: src/<%= pluralName %>/infrastructure/persistence/typeorm/<%= lowerCaseName %>.entity.ts
---
import { CreateDateColumn, UpdateDateColumn, Entity, PrimaryGeneratedColumn, Column } from 'typeorm';
@Entity({ name: '<%= pluralName %>' })
export class <%= classifiedName %>Entity {
  @PrimaryGeneratedColumn('uuid') id: string;
  @Column({ type: 'varchar', unique: true }) name: string;
  // HYGEN-ENTITY-PROPERTY-START

  // HYGEN-ENTITY-PROPERTY-END
  @CreateDateColumn({ type: 'timestamp' }) createdAt: Date;
  @UpdateDateColumn({ type: 'timestamp' }) updatedAt: Date;
}