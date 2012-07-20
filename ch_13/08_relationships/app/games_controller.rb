class GamesController < UITableViewController
  attr_accessor :delegate

  def viewDidLoad
    view.dataSource = view.delegate = self

    @searchBar ||= UISearchBar.alloc.initWithFrame(CGRectMake(0.0, 0.0, self.view.bounds.size.width, 44.0))
    @searchDisplayController ||= UISearchDisplayController.alloc.initWithSearchBar(@searchBar, contentsController:self).tap do |sc|
      sc.delegate = sc.searchResultsDataSource = sc.searchResultsDelegate = self
    end
    tableView.tableHeaderView = @searchBar
  end

  def viewWillAppear(animated)
    self.title = 'Games'
    
    navigationItem.leftBarButtonItem = editButtonItem
    navigationItem.rightBarButtonItem = UIBarButtonItemAdd.withTarget(self, action:'addGame')

  	self.contentSizeForViewInPopover = CGSizeMake(310.0, view.rowHeight*10)
   end
  
  def shouldAutorotateToInterfaceOrientation(interfaceOrientation)
    interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown
  end

  def addGame
    today = ISO8601DateFormatter.alloc.init.stringFromDate(NSDate.date)
    json = "{
      \"timestamp\": \"#{ISO8601DateFormatter.alloc.init.stringFromDate(NSDate.date)}\",
      \"year\": #{NSDate.date.year},
      \"name\": \"game#{rand(100)}\"
    }"
    
    Game.add do |game|
      game.from_json(json)
    end
    view.reloadData
  end

  def searchDisplayController(controller, shouldReloadTableForSearchString:searchString)
    Game.reset  
    @searchString = searchString
    true
  end

  def fetchControllerForTableView(tableView)
    if tableView == self.tableView then Game.controller else Game.searchController(@searchString) end
  end
  
  def numberOfSectionsInTableView(tableView)
    self.fetchControllerForTableView(tableView).sections.size
  end

  def tableView(tableView, titleForHeaderInSection:section)
    self.fetchControllerForTableView(tableView).sections[section].name
  end
  
  def tableView(tableView, numberOfRowsInSection:section)
    self.fetchControllerForTableView(tableView).sections[section].numberOfObjects
  end

  CellID = 'CellIdentifier'
  def tableView(tableView, cellForRowAtIndexPath:indexPath)
    cell = tableView.dequeueReusableCellWithIdentifier(CellID) || UITableViewCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier:CellID).tap do |c|
      c.accessoryType = UIDevice.ipad? ? UITableViewCellAccessoryNone : UITableViewCellAccessoryDisclosureIndicator
    end
    
    cell.textLabel.text = self.fetchControllerForTableView(tableView).objectAtIndexPath(indexPath).name
    cell
  end

  def tableView(tableView, commitEditingStyle:editingStyle, forRowAtIndexPath:indexPath)
    self.fetchControllerForTableView(tableView).objectAtIndexPath(indexPath).remove
    tableView.updates do
      if tableView.numberOfRowsInSection(indexPath.section) == 1
        tableView.deleteSections(NSIndexSet.indexSetWithIndex(indexPath.section), withRowAnimation:UITableViewRowAnimationFade)
      end
      tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation:UITableViewRowAnimationFade)
    end
  end
  
  def tableView(tableView, didSelectRowAtIndexPath:indexPath)
    tableView.deselectRowAtIndexPath(indexPath, animated:true)

    @delegate.openGame(self.fetchControllerForTableView(tableView).objectAtIndexPath(indexPath))
    navigationController.pushViewController(@delegate, animated:true) unless UIDevice.ipad?
  end
end

