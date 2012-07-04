class Company 
  DB = 'company.sqlite'
  #ManagedObjectClasses = [Manager, Employee]
  
  def self.shared
    # singleton access matters 
    @shared ||= Company.new
  end

  def context
    @context
  end

  #def add_manager
    #yield NSEntityDescription.insertNewObjectForEntityForName('Manager', inManagedObjectContext:@context)
    #save
  #end

  #def remove_manager(manager)
    #@context.deleteObject(manager)
    #save
  #end

private
  
  def save
    error_ptr = Pointer.new(:object)
    unless @context.save(error_ptr)
      raise "Error when saving the model: #{error_ptr[0].description}"
    end
    
    # Clear caches, they will be reloaded on demand
    #ManagedObjectClasses.each {|c| c.reset}
  end

  def initialize
    # Create the model programmatically. The data will be stored in a SQLite database, inside the application's Documents folder.
    model = NSManagedObjectModel.alloc.init
    p model
    #model.entities = [Manager.entity, Employee.entity]
    #p model.entities
    #model.entities.each do |entity| 
    #  p entity 
    #  entities = entity.managedObjectModel.entitiesByName
    # 
    #  entity.relationshipsByName.values.flatten.each do |property|
    #    property.destinationEntity = entities[property.destinationEntityName]
    #    property.inverseRelationship = property.destinationEntity.relationshipsByName[property.inverseRelationshipName]
    #  end
    #end

    store = NSPersistentStoreCoordinator.alloc.initWithManagedObjectModel(model)
    store_url = NSURL.fileURLWithPath(File.join(NSHomeDirectory(), 'Company', DB))
    error_ptr = Pointer.new(:object)
    unless store.addPersistentStoreWithType(NSSQLiteStoreType, configuration:nil, URL:store_url, options:nil, error:error_ptr)
      raise "Can't add persistent SQLite store: #{error_ptr[0].description}"
    end

    context = NSManagedObjectContext.alloc.init
    context.persistentStoreCoordinator = store
    @context = context
  end
end