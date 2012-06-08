class TableViewController < UIViewController
  def viewDidLoad
    super

    view.backgroundColor = UIColor.whiteColor
    @myTableView = UITableView.alloc.initWithFrame(view.bounds, style:UITableViewStyleGrouped)
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
      result = 1
    end
    result
  end

  # responding to user interaction
  def tableView(tableView, didSelectRowAtIndexPath:indexPath)
    NSLog("Section: #{indexPath.section}, Cell: #{indexPath.row} is selected")
  end

  # Sets the number of rows in each section
  def tableView(tableView, numberOfRowsInSection:section)
    result = 10 
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
      button.setTitle("Move 2 Top", forState:UIControlStateNormal)
      button.addTarget(self, action:'doSwap:', forControlEvents:UIControlEventTouchUpInside)

      #show both types for fun!
      result.accessoryView = button
    end
    result
  end

  def doSwap(paramSender)
    ownerCell = paramSender.superview

    unless (ownerCell == nil)
      # index path of the cll which contains the section and row of the cell
      ownerCellIndexPath = @myTableView.indexPathForCell(ownerCell)
      p "Accessory in index path is tapped.  Index path = #{ownerCellIndexPath}"
      p "section = #{ownerCellIndexPath.section} and row = #{ownerCellIndexPath.row}"

      if (ownerCellIndexPath.section == 0)
        sourceIndexPath = ownerCellIndexPath
        destinationIndexPath = NSIndexPath.indexPathForRow(0, inSection:0)

        @myTableView.moveRowAtIndexPath(sourceIndexPath, toIndexPath:destinationIndexPath)
      end

    end

  end

  # respond to accessory tap
  def tableView(tableView, accessoryButtonTappedForRowWithIndexPath:indexPath)
    ownerCell = tableView.cellForRowAtIndexPath(indexPath)
    NSLog("Tapped! Cell Title = #{ownerCell.textLabel.text}")
  end

end
