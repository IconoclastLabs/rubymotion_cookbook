class RootController < UIViewController

  def handleKeyboardDidShow(paramNotification)
    keyboardRectAsObject = paramNotification.userInfo(objectForKey:UIKeyboardFrameEndUserInfoKey)
    #keyboardRectAsObject.getValue(&keyboardRect)

    keyboardRect = keyboardRectAsObject.keyboardRect
    @my_text_view.contentInset = UIEdgeInsetsMake(0.0, 0.0, keyboardRect.size.height, 0.0)
  end

  def handleKeyboardWillHide(paramNotification)
    @my_text_view.contentInset = UIEdgeInsertZero
  end

  def viewWillAppear(paramAnimated)
    #super.viewWillAppear(paramAnimated)
    
    NSNotificationCenter.defaultCenter.addObserver(self, selector:'handleKeyboardDidShow', name:UIKeyboardDidShowNotification, object:nil)
    NSNotificationCenter.defaultCenter.addObserver(self, selector:'handleKeyboardWillHide', name:UIKeyboardWillHideNotification, object:nil)

    view.backgroundColor = UIColor.whiteColor

    @my_text_view = UITextView.alloc.initWithFrame(self.view.bounds)
    @my_text_view.text = "Some text"
    @my_text_view.font = UIFont.systemFontOfSize(16)
    view.addSubview(@my_text_view)
  end 

  def viewWillDisappear(paramAnimated)
    super.viewWillDisappear(paramAnimated)

    NSNotificationCenter.defaultCenter.removeObserver(self)
  end

end
