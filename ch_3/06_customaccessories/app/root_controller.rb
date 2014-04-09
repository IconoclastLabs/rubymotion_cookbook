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
      
      button = UIButton.buttonWithType(UIButtonTypeRoundedRect)
      button.frame = [[0,0],[100,25]]
      button.setTitle("Expand", forState:UIControlStateNormal)
      button.addTarget(self, action:'performExpand:', forControlEvents:UIControlEventTouchUpInside)

      #show both types for fun!
      result.accessoryView = button
    end
    result
  end

  def performExpand(paramSender)
    ownerCell = paramSender.superview

    unless (ownerCell == nil)
      # index path of the cll which contains the section and row of the cell
      ownerCellIndexPath = @myTableView.indexPathForCell(ownerCell)
      p "Accessory in index path is tapped.  Index path = #{ownerCellIndexPath}"
      #p "section = #{ownerCellIndexPath.section} and row = #{ownerCellIndexPath.row}"

      #if (ownerCellIndexPath.section == 0 && ownerCellIndexPath.row ==1)
        # This is the second row in the first section
      #end
      p "This doesn't work - Needs fixing"

    end

  end

  # respond to accessory tap
  def tableView(tableView, accessoryButtonTappedForRowWithIndexPath:indexPath)
    ownerCell = tableView.cellForRowAtIndexPath(indexPath)
    NSLog("Tapped! Cell Title = #{ownerCell.textLabel.text}")
  end

end
