class Manager < NSManagedObject

  def self.entity
    @entity ||= begin
      # Create the entity for our Employee class. The entity has 3 properties. CoreData will appropriately define accessor methods for the properties.
      entity = NSEntityDescription.alloc.init
      entity.name = 'Manager'
      entity.managedObjectClassName = 'Manager'
      properties =
        ['first_name', NSStringAttributeType,
         'last_name', NSStringAttributeType,
         'age', NSInteger16AttributeType].each_slice(2).map do |name, type|
            property = NSAttributeDescription.alloc.init
            property.name = name
            property.attributeType = type
            property.optional = false
            property
          end
      
      #13.08 Relationships
      #relationship = NSRelationshipDescription.alloc.init
      #relationship.name = 'employees'
      #relationship.optional = true
      #relationship.indexed = false
      #relationship.ordered = true
      #relationship.minCount = 0
      #relationship.maxCount = 200 #NSIntegerMax should be here
      #relationship.deleteRule = NSCascadeDeleteRule # NSNoActionDeleteRule NSNullifyDeleteRule NSCascadeDeleteRule NSDenyDeleteRule

      #relationship.destinationEntity = Employee.entity
      #relationship.inverseRelationship = relationship.destinationEntity.relationshipsByName['manager']

      #entity.properties = properties + [relationship]
      entity
    end
  end 
end
