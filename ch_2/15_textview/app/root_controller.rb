class RootController < UIViewController

  def handleKeyboardDidShow(notification)
    @my_text_view.text = "kb shown"
  end

  def handleKeyboardWillHide(notification)
    @my_text_view.text = "kb hidden"
  end

  def register_keyboard_notifications
    NSNotificationCenter.defaultCenter.addObserver(self, selector:'handleKeyboardDidShow:', name:UIKeyboardDidShowNotification, object:nil)
    NSNotificationCenter.defaultCenter.addObserver(self, selector:'handleKeyboardWillHide:', name:UIKeyboardWillHideNotification, object:nil)
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
