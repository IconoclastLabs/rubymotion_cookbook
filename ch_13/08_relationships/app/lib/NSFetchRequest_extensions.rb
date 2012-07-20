class NSFetchRequest
  def self.requestForEntityForName(entityName, withSortKeys:sortKeys, ascending:aBoolean, withsearchKey:searchKey, withSearchString:searchString, inManagedObjectContext:context)
    # Fetch all entityName from the model, filtering by searchKey and sorting by sortKey
    request = self.alloc.init
    request.entity = NSEntityDescription.entityForName(entityName, inManagedObjectContext:context)
    
    request.predicate = NSPredicate.predicateWithFormat("#{searchKey} contains[cd] %@", argumentArray:[searchString]) if searchKey
    
    request.sortDescriptors = sortKeys.collect { |sortKey|
      NSSortDescriptor.alloc.initWithKey(sortKey, ascending:aBoolean)
    } unless sortKeys == nil
    
    request
  end
  
  def self.fetchObjectsForEntityForName(entityName, withSortKeys:sortKeys, ascending:aBoolean, inManagedObjectContext:context)
    request = self.requestForEntityForName(entityName, withSortKeys:sortKeys, ascending:aBoolean, withsearchKey:nil, withSearchString:nil, inManagedObjectContext:context)
    
    error_ptr = Pointer.new(:object)
    data = context.executeFetchRequest(request, error:error_ptr)
    if data == nil
      raise "Error when fetching data: #{error_ptr[0].description}"
    end
    data
  end

  def self.fetchObjectsForEntityForName(entityName, withSectionKey:sectionKey, withSortKeys:sortKeys, ascending:aBoolean, withsearchKey:searchKey, withSearchString:searchString, inManagedObjectContext:context)
    request = self.requestForEntityForName(entityName, withSortKeys:sortKeys, ascending:aBoolean, withsearchKey:searchKey, withSearchString:searchString, inManagedObjectContext:context)
    
    error_ptr = Pointer.new(:object)
    controller = NSFetchedResultsController.alloc.initWithFetchRequest(request, managedObjectContext:context, sectionNameKeyPath:sectionKey, cacheName:nil)      
    unless controller.performFetch(error_ptr)
      raise "Error when fetching data: #{error_ptr[0].description}"
    end
    
    controller
  end
end