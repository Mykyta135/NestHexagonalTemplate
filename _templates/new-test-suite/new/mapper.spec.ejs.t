---
# This template's only job is to create the mapper test file.
to: src/<%= pluralName %>/application/mappers/<%= singularName %>.mapper.spec.ts
---
<% Singular = classifiedSingular %>
import { <%= Singular %>Mapper } from './<%= singularName %>.mapper';
import { <%= Singular %> } from '../../domain/<%= singularName %>';
import { <%= Singular %>Entity } from '../../infrastructure/persistence/typeorm/<%= singularName %>.entity';
import { <%= Singular %>Dto } from '../dto/response/<%= singularName %>.dto';

describe('<%= Singular %>Mapper', () => {
  describe('toDomain', () => {
    it('should map an entity to a domain object', () => {
      const entity = new <%= Singular %>Entity();
      entity.id = 'test-id';
      entity.name = 'Test Name';
      entity.createdAt = new Date();
      entity.updatedAt = new Date();

      const domain = <%= Singular %>Mapper.toDomain(entity);

      expect(domain).toBeInstanceOf(<%= Singular %>);
      expect(domain.id).toEqual(entity.id);
      expect(domain.name).toEqual(entity.name);
    });
  });

  describe('toPersistence', () => {
    it('should map a domain object to a persistence entity', () => {
      const domain = <%= Singular %>.create({ 
        <%- mockCreateProps %> 
      });
      const entity = <%= Singular %>Mapper.toPersistence(domain);
      expect(entity).toBeInstanceOf(<%= Singular %>Entity);
      expect(entity.id).toEqual(domain.id);
    });
  });

  describe('toDto', () => {
    it('should map a domain object to a DTO', () => {
      const domain = <%= Singular %>.create({ 
        <%- mockCreateProps %> 
      });
      const dto = <%= Singular %>Mapper.toDto(domain);
      expect(dto).toBeInstanceOf(<%= Singular %>Dto);
      expect(dto.id).toEqual(domain.id);
    });
  });
});