class RootController < UIViewController
  attr_accessor :delegate
  
  def managedObjectContext
    #appDelegate = UIApplication.sharedApplication.delegate
    #managedObjectContext = appDelegate.managedObjectContext;

    #managedObjectContext
    @context
  end

  def controllerDidChangeContent controller
    @table_view_persons.reloadData
  end

  def init
    super

    p "Reading values"
    fetchRequest = NSFetchRequest.alloc.init

    ageSort = NSSortDescriptor.alloc.initWithKey("age", ascending:true)
    firstNameSort = NSSortDescriptor.alloc.initWithKey("firstName", ascending:true)
    sortDescriptors = [ageSort, firstNameSort]

    fetchRequest.sortDescriptors = sortDescriptors
    fetchRequest.setEntity(Person.entity)
    p "FRC gets initialized"
    @context = NSManagedObjectContext.alloc.init
    @persons_FRC = NSFetchedResultsController.alloc.initWithFetchRequest(fetchRequest, managedObjectContext:@context, sectionNameKeyPath:nil, cacheName:nil)
    @persons_FRC.delegate = self
    reading_saves
  end

  def addNewPerson paramSender
    

  end

  def viewDidLoad

    view.backgroundColor = UIColor.lightGrayColor
  
    self.title = "Persons"

    @table_view_persons = UITableView.alloc.initWithFrame(view.bounds, style:UITableViewStylePlain)
    @table_view_persons.delegate = self
    #@table_view_persons.dataSource = self
    view.addSubview(@table_view_persons)

    @barButtonAddPerson = UIBarButtonItem.alloc.initWithBarButtonSystemItem(UIBarButtonSystemItemAdd, target:self, action:'addNewPerson:')
    self.navigationItem.setLeftBarButtonItem(self.editButtonItem, animated:false)
    self.navigationItem.setRightBarButtonItem(@barButtonAddPerson, animated:false) 

    #reading_saves
  end

  def viewDidUnload
    super
    @barButtonAddPerson = nil
    @table_view_persons = nil
  end

  def reading_saves

    ## 13.07
    requestError = Pointer.new(:object)
    if @persons_FRC.performFetch(requestError)
      p "Successful Fetch"
    else
      p "Failed to fetch"
    end
    ## 
  end

  def numberOfSectionsInTableView(tableView)
    1
  end

  def tableView(tableView, numberOfRowsInSection:section)
    sectionInfo = @persons_FRC.sections.objectAtIndex(section)
    sectionInfo.numberOfObjects
    
  end

  def tableView(tableView, cellForRowAtIndexPath:indexPath)
    result = nil
    personTableViewCell = "PersonTableViewCell"
    result = tableView.dequeueReusableCellWithIdentifier(personTableViewCell)

    if result.nil?
      result = UITableViewCell.alloc.initWithStyle(UITableViewCellStyleSubtitle, reuseIdentifier:personTableViewCell)
      result.selectionStyle = UITableViewCellSelectionStyleNone
    end

    p "Tryiing to access FRC"
    person = @persons_FRC.objectAtIndexPath(indexPath)

    result.textLabel.text = person.firstName.stringByAppendingFormat(" ", person.lastName)
    result.detailTextLabel.text = "Age #{person.age}"

    result
  end

  def tableView(tableView, commitEditingStyle:editingStyle, forRowAtIndexPath:indexPath)
    personToDelete = @persons_FRC.objectAtIndexPath(indexPath)
    
    #important: Make sure not to reload table while deleting
    @persons_FRC.delegate = nil

    self.managedObjectContext.deleteObject(personToDelete)

    if (personToDelete.isDeleted)
      savingError = Pointer.new(:object)

      if self.managedObjectContext.save(savingError)
        fetchingError = Pointer.new(:object)
        if @persons_FRC.performFetch(fetchingError)
          p "Successfully fetched"
          rowsToDelete = NSArray.alloc.initWithObjects(indexPath, nil)
          
          @table_view_persons.deleteRowsAtIndexPaths(rowsToDelete, withRowAnimation:UITableViewRowAnimationAutomatic)
        else
          p "Failed to fetch with error #{fetchingError[0].description}"
        end
        p "Failed to save the context with error #{savingError[0].description}"
      end
    end

    # annnnnd we're back.
    @persons_FRC.delegate = self;
  end

  def tableView(tableView, editingStyleForRowAtIndexPath:indexPath)
    UITableViewCellEditingStyleDelete
  end

  def setEditing(paramEditing, animated:paramAnimated)
    super.setEditing(paramEditing, animated:paramAnimated)

    if paramEditing
      self.navigationItem.setRightBarButtonItem(nil, animated:true)
    else
      self.navigationItem.setRightBarButtonItem(@barButtonAddPerson, animated:true)
    end

    @table_view_persons.setEditing(paramEditing, animated:true)
  end


end
