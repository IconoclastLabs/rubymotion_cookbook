class GameController < UITableViewController
  attr_accessor :game, :popoverViewController

  def viewDidLoad
    view.dataSource = view.delegate = self
  end

  def viewWillAppear(animated)
    self.title = 'Game'
    
    navigationItem.rightBarButtonItem = UIBarButtonItemAdd.withTarget(self, action:'addPlayer')

    @playerController ||= UITableViewControllerForNSManagedObject.alloc.initWithStyle(UITableViewStyleGrouped)
    @navPlayerController ||= UINavigationControllerDoneCancel.withRootViewController(@playerController, target:self, done:'doneEditing', cancel:'cancelEditing')
    
    Player.reset
    view.reloadData
  end

  def shouldAutorotateToInterfaceOrientation(interfaceOrientation)
    interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown
  end
  
  def splitViewController(svc, willHideViewController:vc, withBarButtonItem:barButtonItem, forPopoverController:pc)
    barButtonItem.title = 'Games'
    self.navigationItem.setLeftBarButtonItem(barButtonItem)
    self.popoverViewController = pc
  end
  
  def splitViewController(svc, willShowViewController:avc, invalidatingBarButtonItem:barButtonItem) 
    self.navigationItem.setLeftBarButtonItems([], animated:false)
    self.popoverViewController = nil
  end
  
  def openGame(game)
    Player.reset
    
    self.game = game
    self.title = game.name
    self.tableView.reloadData
    self.popoverViewController.dismissPopoverAnimated(true) unless self.popoverViewController == nil
  end

  def addPlayer
    Player.add do |player|
      player.name = "John#{rand(100)}"
      player.game = game
      @playerController.object = player
      @playerController.is_update = false
    end
    navigationController.presentModalViewController(@navPlayerController, animated:true)
  end
  
  def editPlayer(player)
    @playerController.object = player
    @playerController.is_update = true
    navigationController.presentModalViewController(@navPlayerController, animated:true)
  end
  
  def deleteEditing
    # Remove the player, the user selected 'Remove this player'
    @playerController.object.remove
    @playerController.dismissModalViewControllerAnimated(true)
    view.reloadData
  end
    
  def cancelEditing
    # Remove the player, the user selected 'Cancel'
    @playerController.object.remove unless @playerController.is_update
    @playerController.dismissModalViewControllerAnimated(true)
    view.reloadData
  end
  
  def doneEditing
    # Save the player, the user selected 'Done'
    @playerController.updateObject
    @playerController.object.update
    @playerController.dismissModalViewControllerAnimated(true)
    view.reloadData
  end

  def numberOfSectionsInTableView(tableView)
    1
  end

  def tableView(tableView, numberOfRowsInSection:section)
    return 0 if game == nil
    
    game.players.count
  end

  CellID = 'CellIdentifier'
  def tableView(tableView, cellForRowAtIndexPath:indexPath)
    cell = tableView.dequeueReusableCellWithIdentifier(CellID) || UITableViewCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier:CellID).tap do |c|
      c.accessoryType = UITableViewCellAccessoryNone
    end

    cell.textLabel.text = game.players.objectAtIndex(indexPath.row).name
    cell
  end

  def tableView(tableView, didSelectRowAtIndexPath:indexPath)
    tableView.deselectRowAtIndexPath(indexPath, animated:true)

    editPlayer(game.players.objectAtIndex(indexPath.row))
  end
end