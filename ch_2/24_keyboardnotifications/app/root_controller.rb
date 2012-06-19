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
    NSNotificationCenter.defaultCenter.addObserver(self, selector:'handleKeyboardWillShow:', name:UIKeyboardWillShowNotification, object:nil)
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

  def handleKeyboardWillShow(notification)
    user_info = notification.userInfo
    animation_curve =  user_info.valueForKey(UIKeyboardAnimationCurveUserInfoKey)
    animation_duration = user_info.valueForKey(UIKeyboardAnimationDurationUserInfoKey)
    keyboard_rect = user_info.valueForKey(UIKeyboardFrameEndUserInfoKey)
    keyboard_rect_ptr = Pointer.new(CGRect.type)
    #set pointer value from the NSConcreteValue
    keyboard_rect.getValue(keyboard_rect_ptr)


    UIView.beginAnimations('changeTableViewContentInset', context:nil)
    UIView.setAnimationDuration(animation_duration)
    UIView.setAnimationCurve(animation_curve)

    @window = UIApplication.sharedApplication.delegate.window #had to add an attribute accessor to AppDelegate to get this

    window_and_kb_intersection_rect = CGRectIntersection(@window.frame, keyboard_rect_ptr[0])
    bottomInset = window_and_kb_intersection_rect.size.height

    @my_table_view.contentInset = UIEdgeInsetsMake(0,0,bottomInset ,0)
    indexPathOfOwnerCell = nil
    cell_count = @my_table_view.dataSource.tableView(@my_table_view, numberOfRowsInSection:0)

    cell_count.times do |counter|
      p counter
      index_path = NSIndexPath.indexPathForRow(counter, inSection:0)
      p index_path
      cell = @my_table_view.cellForRowAtIndexPath(index_path)
      p cell #returns UITableViewCell
      text_field = cell.accessoryView
      p text_field # reeturns UITextField
      # possibly replace with text_field.class == UITextField.class ?
      if(text_field.isKindOfClass(UITextField.class) == false)
        p "text_field was not a UITextField...keep going"
        next
      end
      if(text_field.isFirstResponder)
        p "text_field was a text field, note that"
        index_path_owner_cell = index_path
      end
    end

    UIView.commitAnimations

    if(!index_path_owner_cell.nil?)
      @my_table_view.scrollToRowAtIndexPath(index_path_owner_cell, atScrollPosition:UITableViewScrollPositionMiddle, animated: true)
    end
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
