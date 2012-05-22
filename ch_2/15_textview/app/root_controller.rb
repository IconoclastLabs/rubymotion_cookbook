class RootController < UIViewController

  def handleKeyboardDidShow(notification)
#    @my_text_view.text = "kb shown"
  end

  def handleKeyboardWillHide(notification)
 #   @my_text_view.text = "kb hidden"
  end

  def viewWillAppear(animated)
    NSNotificationCenter.defaultCenter.addObserver(self, selector:'handleKeyboardWillHide:', name:UIKeyboardWillHideNotification, object:object)
#.addObserver(self, selector:'handleKeyboardDidShow:', name:UIKeyboardDidShowNotification, object:object)
#    NSNotificationCenter.defaultCenter.addObserver(self, selector:'handleKeyboardWillHide:', name:UIKeyboardWillHideNotification, object:object)

    view.backgroundColor = UIColor.whiteColor
    @my_text_view = UITextView.alloc.initWithFrame(view.bounds)
    @my_text_view.text = "Some text"
    @my_text_view.font = UIFont.systemFontOfSize(16)
    view.addSubview(@my_text_view)

    #@notifcation_center.addObserverForName(UIKeyboardDidShowNotification, object:object, queue:queue, 
    #  usingBlock:lambda do |notification|
    #    keyboardRectAsObject = paramNotification.userInfo[UIKeyboardFrameEndUserInfoKey]
    #    keyboardRect = keyboardRectAsObject.keyboardRect
    #    @my_text_view.contentInset = UIEdgeInsetsMake(0.0, 0.0, keyboardRect.size.height, 0.0)
    #  end)
  end

  def viewWillDisappear(animated)
    NotificationCenter.defaultCenter.removeObserver(self)
  end

end
