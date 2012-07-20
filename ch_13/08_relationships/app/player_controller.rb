class PlayerController < UITableViewController
  attr_accessor :player, :is_update

  def text
    @cell.textField.text
  end
  
  def viewDidLoad
    super # get keyboard notifications
    view.dataSource = view.delegate = self
  end

  CellID = 'CellIdentifier'
  def viewWillAppear(animated)
    self.title = 'Player'
    
    @cell ||= UITableViewTextFieldCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier:CellID).tap do |c|
      c.textLabel.text = 'Name'
      c.textField.tap do |tf|
        tf.placeholder = 'Enter player\'s name'
        tf.returnKeyType = UIReturnKeyDone
        tf.delegate = self
      end
      c
    end
    @cell.textField.text = player.name
  
    setEditing(true, animated:true)
  end

  def shouldAutorotateToInterfaceOrientation(interfaceOrientation)
    interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown
  end

  def tableView(tableView, numberOfRowsInSection:section)
    1
  end
  
  def tableView(tableView, editingStyleForRowAtIndexPath:indexPath)
    UITableViewCellEditingStyleNone
  end
  
  def tableView(tableView, shouldIndentWhileEditingRowAtIndexPath:indexPath)
    false
  end

  def tableView(tableView, cellForRowAtIndexPath:indexPath)
    @cell
  end
 
  def textFieldShouldReturn(textField)
    textField.resignFirstResponder
    true
  end
end