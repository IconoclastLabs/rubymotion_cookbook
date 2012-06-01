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

  def viewDidAppear(animated)
    NSNotificationCenter.defaultCenter.addObserver(self, selector:'handleKeyboardDidShow:', name:UIKeyboardDidShowNotification, object:nil)
    NSNotificationCenter.defaultCenter.addObserver(self, selector:'handleKeyboardWillHide:', name:UIKeyboardWillHideNotification, object:nil)
    
  end

  def viewDidDisappear(animated)

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

      result.selectionStyle = UITableViewCellSelectionStyleNone
      result.textLabel.text = "Cell: #{indexPath.row}"
      accessory_rect = CGRectMake(0,0,150,31)
      accessory = UITextField.alloc.initWithFrame(accessory_rect)
      accessory.borderStyle = UITextBorderStyleRoundedRect
      accessory.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter
      accessory.placeholder = "Enter Text:"
      accessory.delegate = self
      result.accessoryView = accessory

    end
    result
  end

  def handleKeyboardDidShow(notification)
    animation_curve =  notification.userInfo['UIKeyboardAnimationCurveUserInfoKey']
    animation_duration = notification.userInfo['UIKeyboardAnimationDurationUserInfoKey']
    kb_end_rect_obj = notification.userInfo['UIKeyboardFrameEndUserInfoKey']

    kb_frame_ptr = Pointer.new(CGRect.type)
    kb_end_rect_obj.getValue(kb_frame_ptr)

    UIView.beginAnimations('changeTableViewContentInset')
    UIView.setAnimationDuration(animation_duration)
    UIView.setAnimationCurve(animation_curve)
    @window = Pointer.new(:object)
    @window = UIApplication.sharedApplication.delegate.window #had to add an attribute accessor to AppDelegate to get this

    intersectionOfKeyboardRectAndWindowRect = CGRectIntersection(@window.frame, kb_end_rect_obj)
    bottomInset = intersectionOfKeyboardRectAndWindowRect.size.height

    @my_table_view.contentInset = UIEdgeInsetsMake(0,0,bottomInset,0)
  end


  def handleKeyboardWillHide(notification)
    if(UIEdgeInsetsEqualToEdgeInsets(@my_table_view, UIEdgeInsetsZero))
      return #table view content inset is intact, no need to reset
    end

    animation_curve =  notification.userInfo['UIKeyboardAnimationCurveUserInfoKey']
    animation_duration = notification.userInfo['UIKeyboardAnimationDurationUserInfoKey']
    kb_end_rect_obj = notification.userInfo['UIKeyboardFrameEndUserInfoKey']

    kb_frame_ptr = Pointer.new(CGRect.type)
    kb_end_rect_obj.getValue(kb_frame_ptr)

    UIView.beginAnimations('changeTableViewContentInset')
    UIView.setAnimationDuration(animation_duration)
    UIView.setAnimationCurve(animation_curve)

    @my_table_view.contentInset = UIEdgeInsetsZero

    UIView.commitAnimations
  end

end
