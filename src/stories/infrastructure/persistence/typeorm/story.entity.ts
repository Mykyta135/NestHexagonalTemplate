import {
  CreateDateColumn,
  UpdateDateColumn,
  Entity,
  PrimaryGeneratedColumn,
  Column,
} from 'typeorm';
@Entity({ name: 'stories' })
export class StoryEntity {
  @PrimaryGeneratedColumn('uuid') id: string;
  @Column({ type: 'varchar', unique: true }) name: string;
  // HYGEN-ENTITY-PROPERTY-START

  @Column({ type: 'number', unique: true, nullable: true })
  price: number | null;
  // HYGEN-ENTITY-PROPERTY-END
  @CreateDateColumn({ type: 'timestamp' }) createdAt: Date;
  @UpdateDateColumn({ type: 'timestamp' }) updatedAt: Date;
}
