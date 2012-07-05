class RootController < UIViewController
  def viewDidLoad
    view.backgroundColor = UIColor.lightGrayColor
  
    self.title = "Core Data"

    @label = UILabel.new
    @label.text = 'No Errors'
    @label.frame = [[0,50],[UIScreen.mainScreen.bounds.size.width,50]]
    view.addSubview(@label)

    initialize_save
    perform_save
    # proof of second save
    perform_save

  end

  def initialize_save
    @label.text = 'Preparing to save data'

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
  end

  def perform_save

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
