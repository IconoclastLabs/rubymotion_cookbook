class RootController < UIViewController
  def viewDidLoad
    view.backgroundColor = UIColor.lightGrayColor
  
    self.title = "Core Data"

    @label = UILabel.new
    @label.text = 'No Errors'
    @label.frame = [[0,50],[UIScreen.mainScreen.bounds.size.width,50]]
    view.addSubview(@label)

    perform_save
    #reading_saves

  end

  def reading_saves
    p "Reading values"
    @label.text = "reading"
    fetchRequest = NSFetchRequest.alloc.init

    ageSort = NSSortDescriptor.alloc.initWithKey("age", ascending:true)
    firstNameSort = NSSortDescriptor.alloc.initWithKey("firstName", ascending:true)
    sortDescriptors = [ageSort, firstNameSort]

    fetchRequest.sortDescriptors = sortDescriptors
    fetchRequest.setEntity(Manager.entity)
    
    requestError = Pointer.new(:object)
    people = @context.executeFetchRequest(fetchRequest, error:requestError)

    if people.count > 0
      p "Values can be read"
      people.each do |person|
        @label.text = "First Name = #{person.firstName} Last Name = #{person.lastName} Age = #{person.age}"
        p @label.text
      end
    else
      p "Cound not find any manager entities in the context"
    end
  end

  def perform_save

    @label.text = 'Attempting a data save'

    # INITIALIZE CoreData Stuffs
    p "Starting up core data stuff"
    model = NSManagedObjectModel.alloc.init
    model.entities = [Manager.entity, Employee.entity]

    store = NSPersistentStoreCoordinator.alloc.initWithManagedObjectModel(model)
    store_url = NSURL.fileURLWithPath(File.join(NSHomeDirectory(), 'Documents', 'honships.sqlite'))
    error_ptr = Pointer.new(:object)
    can_store =  store.addPersistentStoreWithType(NSSQLiteStoreType, configuration:nil, URL:store_url, options:nil, error:error_ptr)
    unless can_store
      raise "Can't use persistent SQLite store: #{error_ptr[0].description}"
    end

    @context = NSManagedObjectContext.alloc.init
    @context.persistentStoreCoordinator = store

    #Save in persistent storage
    p "Actually getting to the point to store stuff"
    newManager = NSEntityDescription.insertNewObjectForEntityForName("Manager", inManagedObjectContext:@context)
    newEmployee1 = NSEntityDescription.insertNewObjectForEntityForName("Employee", inManagedObjectContext:@context)
   # newEmployee2 = NSEntityDescription.insertNewObjectForEntityForName("Employee", inManagedObjectContext:@context)

    unless newManager.nil? #|| newEmployee1.nil? || newEmployee2.nil?
      newManager.firstName = "Iconoclast#{rand(100)}"
      newManager.lastName = "Labs Manager"
      newManager.age = rand(100)

      newEmployee1.firstName = "Employee1"
      newEmployee1.lastName = "Lastname1"
      newEmployee1.age = rand(100)
      newEmployee1.manager = newManager

    #  newEmployee2.firstName = "Employee2"
    #  newEmployee2.lastName = "Lastname2"
    #  newEmployee2.age = rand(100)
    #  newEmployee2.manager = newManager

      savingError = Pointer.new(:object)
      if @context.save(savingError)
        @label.text = "Managers and Employees were saved successfully"
        p "Successful save!"
      else
        p "Failed to save! Error #{savingError[0].description}"
      end

    else
      p "Failed to create new peeps for some reason"
    end

  end

end
