class TableViewController < UIViewController
  def viewDidLoad
    super

    view.backgroundColor = UIColor.whiteColor
    @myTableView = UITableView.alloc.initWithFrame(view.bounds, style:UITableViewStylePlain)
    @myTableView.dataSource = self
    @myTableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight

    view.addSubview(@myTableView)


    @arrayOfRows = []

    for i in 0..9
     @arrayOfRows.addObject("Cell #{i}") 
    end
  end

  # Required for TableView datasource protocol
  # Sets the number of sections for the tableView
  def numberOfSectionsInTableView(tableView)
    1
  end

  # Sets the number of rows in each section
  def tableView(tableView, numberOfRowsInSection:section)
    @arrayOfRows.length
  end

  # Modifies each cell
  def tableView(tableView, cellForRowAtIndexPath:indexPath)
    result = nil

    if(tableView == @myTableView)
      tableViewCellIdentifier = "MyCells"

      result = tableView.dequeueReusableCellWithIdentifier(tableViewCellIdentifier)

      if(result == nil)
        result = UITableViewCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier:tableViewCellIdentifier)
      end

      result.textLabel.text = @arrayOfRows[indexPath.row]
    end
    result
  end


  def tableView(tableView, edititngStyleForRowAtIndexPath:indexPath)
    result = UITableViewCellEditingStyleNone

    result = UITableViewCellEditingStyleDelete if tableView == @myTableView

    result
  end

  def setEditing(editing, animated:animated)
    super

    @myTableView.setEditing(editing, animated:animated)
  end

  def tableView(tableView, commitEditingStyle:editingStyle, forRowAtIndexPath:indexPath)
    if (editingStyle == UITableViewCellEditingStyleDelete)
      if (indexPath.row < @arrayOfRows.length)
        #first remove this object from source
        @arrayOfRows.removeObjectAtIndex(indexPath.row)

        # Then remove associated cell from table view
        tableView.deleteRowsAtIndexPaths(NSArray.arrayWithObject(indexPath), withRowAnimation:UITableViewRowAnimationLeft)
      end
    end
  end

end
