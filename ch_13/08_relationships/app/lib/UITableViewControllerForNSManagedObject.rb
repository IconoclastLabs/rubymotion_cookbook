class UITableViewControllerForNSManagedObject < UITableViewController
  attr_accessor :object, :is_update
  
  def viewDidLoad
    super # get keyboard notifications
    view.dataSource = view.delegate = self
  end

  def viewWillAppear(animated)
    @cells ||= @object.to_cells(self)
    @cells.each {|cell| cell.clear}  
    setEditing(true, animated:true)
  end  
  
  def updateObject
    @object.from_cells(@cells)
  end

  def shouldAutorotateToInterfaceOrientation(interfaceOrientation)
    interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown
  end
  
  def sections
    @object.managedObjectClass.sections
  end

  def numberOfSectionsInTableView(tableView)
    sections.size
  end

  def tableView(tableView, titleForHeaderInSection:section)
    sections[section][0]
  end
  
  def tableView(tableView, numberOfRowsInSection:section)
    sections[section][1].size / 3
  end

  def tableView(tableView, editingStyleForRowAtIndexPath:indexPath)
    UITableViewCellEditingStyleNone
  end
  
  def tableView(tableView, shouldIndentWhileEditingRowAtIndexPath:indexPath)
    false
  end

  def tableView(tableView, cellForRowAtIndexPath:indexPath)
    property = sections[indexPath.section][1][indexPath.row*3 + 1]
    @cells[property]
  end
  
  def textFieldShouldReturn(textField)
    @numTextFields ||= sections.flatten.select{|x| x == :text or x == :longtext}.size
    
    if textField.tag == @numTextFields then
     textField.resignFirstResponder
     return true
    end

    view.viewWithTag(textField.tag + 1).becomeFirstResponder

    #nextIndexPath = [0, textField.tag].to_ip
    #tableView.selectRowAtIndexPath(nextIndexPath, animated:false, scrollPosition:UITableViewScrollPositionNone)
    #tableView.scrollToRowAtIndexPath(nextIndexPath, atScrollPosition:UITableViewScrollPositionNone, animated:true)

    false
  end
end