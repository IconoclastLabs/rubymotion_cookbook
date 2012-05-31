class TableViewController < UIViewController
  def viewDidLoad
    super

    view.backgroundColor = UIColor.whiteColor
    @myTableView = UITableView.alloc.initWithFrame(view.bounds, style:UITableViewStylePlain)
    @myTableView.dataSource = self
    @myTableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight

    view.addSubview(@myTableView)
  end

  # Required for TableView datasource protocol
  # Sets the number of sections for the tableView
  def numberOfSectionsInTableView(tableView)
    result = 0
    if (tableView == @myTableView)
      result = 3
    end
    result
  end

  # Sets the number of rows in each section
  def tableView(tableView, numberOfRowsInSection:section)
    result = 0
    if(tableView == @myTableView)
      result = case section
        when 0 then 3
        when 1 then 5
        when 2 then 8
        else 0
      end
    end
    result
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

      result.textLabel.text = "Section: #{indexPath.section}, Cell: #{indexPath.row}"
    end
    result
  end

  # 3.10 stuffs
  # if yes/true then iOS will display the context menu for the table view cell whose index 
  # gets passed to you through the shouldShowMenueForRowAtIndexPath param 
  def tableView(tableView, shouldShowMenuForRowAtIndexPath:indexPath)
    true
  end

  def tableView(tableView, canPerformAction:action, forRowAtIndexPath:indexPath, withSender:sender)
    p NSStringFromSelector(action)

    # filter actions, return true to enable and false to disable
    # But for now, always return true (enable all)
    true
  end

  def tableView(tableView, performAction:action, forRowAtIndexPath:indexPath, withSender:sender)
    # Example implementation of how to do copy, should that have been selected
    if (action == :"copy:")
      cell = tableView.cellForRowAtIndexPath(indexPath)
      paste_board = UIPasteboard.generalPasteboard
      #take current string and put it in paste
      paste_board.setString(cell.textLabel.text)
      p "Copying the text '#{cell.textLabel.text}' to UIPasteboard"
    end
  end

end
