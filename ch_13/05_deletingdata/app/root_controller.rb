class RootController < UIViewController
  def viewDidLoad
    view.backgroundColor = UIColor.lightGrayColor
  
    self.title = "Core Data"

    @label = UILabel.new
    @label.text = 'No Errors'
    @label.frame = [[0,50],[UIScreen.mainScreen.bounds.size.width,50]]
    view.addSubview(@label)

    perform_save
    reading_saves
    delete_last
    reading_saves

  end

  def delete_last
    fetchRequest = NSFetchRequest.alloc.init

    fetchRequest.setEntity(Person.entity)
    
    requestError = Pointer.new(:object)
    people = @context.executeFetchRequest(fetchRequest, error:requestError)

    if people.count > 0
      p "get ready to delete"
      lastPerson = people.lastObject
      @context.deleteObject(lastPerson)

      savingError = Pointer.new(:object)
      if @context.save(savingError)
        @label.text = "Deleted the last person!"
        p @label.text
      else
        @label.text = "Failed to delete last person"
        raise "Failed! #{savingError[0].description}"
      end
    else
      p "Cound not find any person entities in the context"
    end
  end

  def reading_saves
    p "Reading values"
    @label.text = "reading"
    fetchRequest = NSFetchRequest.alloc.init

    fetchRequest.setEntity(Person.entity)
    
    requestError = Pointer.new(:object)
    people = @context.executeFetchRequest(fetchRequest, error:requestError)

    if people.count > 0
      p "Values can be read"
      people.each do |person|
        @label.text = "First Name = #{person.firstName} Last Name = #{person.lastName} Age = #{person.age}"
        p @label.text
      end
    else
      p "Cound not find any person entities in the context"
    end
  end

  def perform_save

    @label.text = 'Attempting a data save'

    # INITIALIZE CoreData Stuffs
    p "Starting up core data stuff"
    model = NSManagedObjectModel.alloc.init
    model.entities = [Person.entity]

    store = NSPersistentStoreCoordinator.alloc.initWithManagedObjectModel(model)
    store_url = NSURL.fileURLWithPath(File.join(NSHomeDirectory(), 'Documents', 'Locations.sqlite'))
    error_ptr = Pointer.new(:object)
    unless store.addPersistentStoreWithType(NSSQLiteStoreType, configuration:nil, URL:store_url, options:nil, error:error_ptr)
      raise "Can't use persistent SQLite store: #{error_ptr[0].description}"
    end

    @context = NSManagedObjectContext.alloc.init
    @context.persistentStoreCoordinator = store

    #Save a person in persistent storage
    p "Actually getting to the point to store stuff"
    newPerson = NSEntityDescription.insertNewObjectForEntityForName("Person", inManagedObjectContext:@context)

    unless (newPerson.nil?)
      newPerson.firstName = "Iconoclast"
      newPerson.lastName = "Labs"
      newPerson.age = rand(100)

      savingError = Pointer.new(:object)
      if @context.save(savingError)
        @label.text = "Person was saved successfully"
        p "Successful save!"
      else
        p "Failed to save! Error #{savingError[0].description}"
      end

    else
      p "Failed to create new person"
    end

  end

end
