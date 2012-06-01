class RootController < UIViewController

  def viewDidLoad
    @my_table_view = UITableView.alloc.initWithFrame(view.bounds, style: UITableViewStyleGrouped)
    @my_table_view.delegate = self
    @my_table_view.dataSource = self
    #@my_table_view.autoresizingMask = 
    view.addSubview(@my_table_view)
  end

  def viewDidUnload
    @my_table_view = nil
  end

  #table view delegates
  def numberOfSectionsInTableView(tableView)
    1
  end

  def tableView(tableView, numberOfRowsInSection:section)
    100
  end

  def tableView(tableView, cellForRowAtIndexPath:indexPath)
    result = nil

    if(tableView == @my_table_view)
      tableViewCellIdentifier = "MyCells"

      result = tableView.dequeueReusableCellWithIdentifier(tableViewCellIdentifier)

      if(result == nil)
        result = UITableViewCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier:tableViewCellIdentifier)
      end

      result.selectionStyle = UITableViewCellStyleNone
      result.textLabel.text = "Section: #{indexPath.section}, Cell: #{indexPath.row}"
      accessory_rect = CGRectMake(0,0,150,31)
      accesory = UITextField.alloc.initWithFrame(accessory_rect)
      accessory.borderStyle = UITextBorderStyleRoundedRect
      accessory.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter
      accessory.placeholder = "Enter Text:"
      accessory.delegate = self
      result.accessoryView = accessory

    end
    result
  end



end
