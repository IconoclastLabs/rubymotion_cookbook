class RootController < UIViewController
  def viewDidLoad
    super

    view.backgroundColor = UIColor.whiteColor
    @myTableView = UITableView.alloc.initWithFrame(view.bounds, style:UITableViewStylePlain)
    @myTableView.dataSource = self
    @myTableView.delegate = self
    @myTableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight

    view.addSubview(@myTableView)
  end

  def viewDidUnload
    @myTableView = nil
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

  # responding to user interaction
  def tableView(tableView, didSelectRowAtIndexPath:indexPath)
    NSLog("Section: #{indexPath.section}, Cell: #{indexPath.row} is selected")
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

end
