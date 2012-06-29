class Employee < NSManagedObject

  def self.entity
    @entity ||= begin
      # Create the entity for our Employee class. The entity has 3 properties. CoreData will appropriately define accessor methods for the properties.
      entity = NSEntityDescription.alloc.init
      entity.name = 'Employee'
      entity.managedObjectClassName = 'Employee'
      properties =
        ['firstName', NSStringAttributeType,
         'lastName', NSStringAttributeType,
         'age', NSInteger16AttributeType].each_slice(2).map do |name, type|
            property = NSAttributeDescription.alloc.init
            property.name = name
            property.attributeType = type
            property.optional = false
            property
          end
      
      #13.08 Relationships
      relationship = NSRelationshipDescription.alloc.init
      relationship.name = 'manager'
      relationship.optional = false
      relationship.indexed = false
      relationship.ordered = false
      relationship.minCount = 1
      relationship.maxCount = 1 
      relationship.deleteRule = NSNullifyDeleteRule # NSNoActionDeleteRule NSNullifyDeleteRule NSCascadeDeleteRule NSDenyDeleteRule

      relationship.destinationEntity = Manager.entity
      relationship.inverseRelationship = relationship.destinationEntity.relationshipsByName['employees']

      entity.properties = properties + [relationship]
      entity
    end
  end 
end
