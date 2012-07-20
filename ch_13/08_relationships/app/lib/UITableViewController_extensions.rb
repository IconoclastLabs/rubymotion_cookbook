class UITableViewController
  def viewDidLoad
     NSNotificationCenter.defaultCenter.addObserver(self, selector:'keyboardDidShow:', name:UIKeyboardDidShowNotification, object:nil)
     NSNotificationCenter.defaultCenter.addObserver(self, selector:'keyboardWillHide:', name:UIKeyboardWillHideNotification, object:nil)
  end
    
  def viewDidUnload
    NSNotificationCenter.defaultCenter.removeObserver(self)
  end
  
  def keyboardDidShow(notification)
    kbSize = notification.userInfo[UIKeyboardFrameBeginUserInfoKey].CGRectValue.size
    kbHeight = UIDevice.portrait? ? kbSize.height : kbSize.width
    contentInsets = UIEdgeInsetsMake(0, 0, kbHeight, 0)
    tableView.contentInset = contentInsets
    tableView.scrollIndicatorInsets = contentInsets
    
    indexPaths = tableView.indexPathsForRowsInRect(tableView.firstResponder.frame)
    if indexPaths[0] then
      tableView.selectRowAtIndexPath(indexPaths[0], animated:false, scrollPosition:UITableViewScrollPositionNone)
      tableView.scrollToRowAtIndexPath(indexPaths[0], atScrollPosition:UITableViewScrollPositionNone, animated:true)
      tableView.scrollRectToVisible(tableView.firstResponder.frame, animated:true)
    end
  end

  def keyboardWillHide(notification)
    contentInsets = UIEdgeInsetsZero
    tableView.contentInset = contentInsets
    tableView.scrollIndicatorInsets = contentInsets
  end
end