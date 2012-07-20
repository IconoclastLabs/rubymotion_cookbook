class NSEntityDescription
  
  DefaultMappings = {
    NSInteger16AttributeType => 0,
    NSInteger32AttributeType => 0,
    NSInteger64AttributeType => 0,
    NSDecimalAttributeType => 0.0,
    NSDoubleAttributeType => 0.0,
    NSFloatAttributeType => 0.0,
    NSStringAttributeType => '',
    NSBooleanAttributeType => false,
    NSDateAttributeType => nil,
    NSBinaryDataAttributeType => nil,
    NSTransformableAttributeType => nil,
    NSObjectIDAttributeType => nil,
  }

  def self.newEntityDescriptionWithName(name, attributes:attributes, relationships:relationships)
    entity = self.alloc.init
    entity.name = name
    entity.managedObjectClassName = name
    
    attributes = attributes.collect do |att|
      property = NSAttributeDescription.alloc.init
      property.name = att[:name]
      property.jsonKeypath = att[:json] || att[:name]
      property.attributeType = att[:type] || NSStringAttributeType
      property.defaultValue = att[:default] || DefaultMappings[att[:type] || NSStringAttributeType]
      property.optional = att[:optional] || false
      property.transient = att[:transient] || false
      property.indexed = att[:indexed] || false
      property
    end
 
    relationships = relationships.collect do |rel|
      property = NSRelationshipDescription.alloc.init
      property.name = rel[:name]
      property.jsonKeypath = rel[:json] || rel[:name]
      property.destinationEntityName = rel[:destination]
      property.inverseRelationshipName = rel[:inverse]
      property.optional = rel[:optional] || false
      property.transient = rel[:transient] || false
      property.indexed = rel[:indexed] || false
      property.ordered = rel[:ordered] || false
      property.minCount = rel[:min] || 1
      property.maxCount = rel[:max] || 1 # NSIntegerMax
      property.deleteRule = rel[:del] || NSNullifyDeleteRule # NSNoActionDeleteRule NSNullifyDeleteRule NSCascadeDeleteRule NSDenyDeleteRule
      property
    end
    
    entity.properties = attributes + relationships
    entity
  end
  
  def wireRelationships
    entities = self.managedObjectModel.entitiesByName
    
    self.relationshipsByName.values.flatten.each do |property|
      property.destinationEntity = entities[property.destinationEntityName]
      property.inverseRelationship = property.destinationEntity.relationshipsByName[property.inverseRelationshipName]
    end
  end
 end
