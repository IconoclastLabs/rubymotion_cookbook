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
    animation_curve_obj =  notification.userInfo['UIKeyboardAnimationCurveUserInfoKey']
    animation_duration_obj = notification.userInfo['UIKeyboardAnimationDurationUserInfoKey']
    kb_end_rect_obj = notification.userInfo['UIKeyboardFrameEndUserInfoKey']

    curve_ptr = Pointer.new(:uint)
    animation_curve_obj.getValue(curve_ptr)
    duration_ptr = Pointer.new(:double)
    animation_duration_obj.getValue(duration_ptr)
    kb_frme_ptr = Pointer.new(CGRect.type)
    kb_frame_obj.getValue(frame_ptr)
    p curve_ptr
    p duration_ptr
    p kb_frme_ptr

    #begin_animations = UIViewController



  end

  def handleKeyboardWillHide(notification)
    p "will hide"
  end


end
