class RootController < UIViewController

  def handleKeyboardDidShow(notification)
    kb_frame_obj = notification.userInfo['UIKeyboardFrameEndUserInfoKey']
    frame_ptr = Pointer.new(CGRect.type)
    kb_frame_obj.getValue(frame_ptr)
    @my_text_view.contentInset = UIEdgeInsetsMake(0,0,frame_ptr[0].size.height,0)
  end

  def handleKeyboardWillHide(notification)
    @my_text_view.contentInset = UIEdgeInsetsZero
  end

  def viewWillAppear(animated)

    view.backgroundColor = UIColor.whiteColor
    @my_text_view = UITextView.alloc.initWithFrame(self.view.bounds)
    @my_text_view.text = "Some text"
    @my_text_view.font = UIFont.systemFontOfSize(16)
    view.addSubview(@my_text_view)
    NSNotificationCenter.defaultCenter.addObserver(self, selector:'handleKeyboardDidShow:', name:UIKeyboardDidShowNotification, object:nil)
    NSNotificationCenter.defaultCenter.addObserver(self, selector:'handleKeyboardWillHide:', name:UIKeyboardWillHideNotification, object:nil)
  end

  def viewWillDisappear(animated)
    NotificationCenter.defaultCenter.removeObserver(self)
  end


end
