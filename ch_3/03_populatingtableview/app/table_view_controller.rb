class TableViewController < UITableViewController
  def viewDidLoad
    view.backgroundColor = UIColor.whiteColor
    @myTableView = UITableView.alloc.initWithFrame(view.bounds, style:UITableViewStylePlain)
    @myTableView.delegate = self
    @myTableView.dataSource = self
    @myTableView.autoresizingMask = UIViewAutoresizingFlexibleWidth || UIViewAutoresizingFlexibleHeight
    
    view.addSubview(@myTableView)
  end

  def tableView(tableView, heighForRowAtIndexPath:indexPath)
    result = 20.0
    result = 40.0 if tableView == @myTableView
    result
  end

  def numberOfSectionsInTableViewi(tableView)
    result = 0
    if(tableView == @myTableView)
      result = 3
    end
    result
  end

  def tableView(tableView, numberOfRowsInSection:section)
    result = 0
    case section
    when 0
      result = 3
    when 1
      result = 5
    when 2
      result = 8
    else
      result = 0
    end
    result
  end

  def tableView(tableView, cellForRowAtIndexPath:indexPath)
    result = nil

    if(tableView == @myTableView)
      cell = tableView.dequeueReusableCellWithIdentifier(CellID) || begin
        cell = UITableViewCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier:CellID)
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator
        cell
      end

      cell.textLabel.text = "Section: #{indexPath.section}, Cell: #{indexPath.row}"
      return cell 
    end

  end
end
