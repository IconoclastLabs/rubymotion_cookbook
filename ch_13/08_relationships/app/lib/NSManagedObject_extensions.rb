class NSManagedObject
  def self.entity
    @entity ||= NSEntityDescription.newEntityDescriptionWithName(name, attributes:@attributes, relationships:@relationships)
  end

  def self.objects
    # Use if you do not need any section in your table view
    @objects ||= NSFetchRequest.fetchObjectsForEntityForName(name, withSortKeys:@sortKeys, ascending:false, inManagedObjectContext:Store.shared.context)
  end

  def self.controller
    # Use if you require sections in your table view
    @controller ||= NSFetchRequest.fetchObjectsForEntityForName(name, withSectionKey:@sectionKey, withSortKeys:@sortKeys, ascending:false, withsearchKey:nil, withSearchString:nil, inManagedObjectContext:Store.shared.context)
  end
  
  def self.searchController(searchString)
    # Use if you have a search bar in your table view
    @searchController ||= NSFetchRequest.fetchObjectsForEntityForName(name, withSectionKey:@sectionKey, withSortKeys:@sortKeys, ascending:false, withsearchKey:@searchKey, withSearchString:searchString, inManagedObjectContext:Store.shared.context)
  end
  
  def self.reset
    @objects = @controller = @searchController = nil
  end

  def self.add
    yield obj = NSEntityDescription.insertNewObjectForEntityForName(name, inManagedObjectContext:Store.shared.context)
    Store.shared.save
    obj
  end
  
  def update
    Store.shared.save
  end

  def remove
    Store.shared.context.deleteObject(self)
    Store.shared.save
  end
  
  def self.sections
    @sections
  end
  
  def self.numTextSections
    @sections.flatten.select{|x| x == :text or x == :longtext}.size
  end
  
  def managedObjectClass
    # Core data objects are not instances of NSManagedObjects, although they behave the same
    # Allow access to the real class
    NSClassFromString(self.entity.managedObjectClassName)
  end
end