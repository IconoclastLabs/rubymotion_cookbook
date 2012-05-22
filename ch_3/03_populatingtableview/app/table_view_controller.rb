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

  # Required for TableView datasource protocol
  # Sets the number of sections for the tableView
  def numberOfRowsInSection(tableView)
    result = 1
    if(tableView == @myTableView)
      result = 3
    end
    result
  end

  # Required for TableView datasource protocol
  def tableView(tableView, numberOfRowsInSection:section)
    result = 1
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

  # Required for TableView datasource protocol
  def tableView(tableView, cellForRowAtIndexPath:indexPath)
    cell_id = "CellID"
    result = nil

    if(tableView == @myTableView)
      result = tableView.dequeueReusableCellWithIdentifier(cell_id)
      if(result == nil)
        result = UITableViewCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier:cell_id)
      end
      result.textLabel.text = "Section: #{indexPath.section}, Cell: #{indexPath.row}"
    end
    result
  end
end
