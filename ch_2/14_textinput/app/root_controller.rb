class RootController < UIViewController
  def viewDidLoad
    view.backgroundColor = UIColor.whiteColor
    @char_pluralization = "Characters"
    @charcount = UITextField.alloc.initWithFrame([[0,0],[100,31]])
    
    @charcount.borderStyle = UITextBorderStyleRoundedRect
    @charcount.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter
    @charcount.textAlignment = UITextAlignmentCenter
    @charcount.text = "0 Characters"
    @charcount.center = view.center
    view.addSubview(@charcount)

    @la


    @text_field = UITextField.alloc.initWithFrame([[0,0],[200,31]])
    @text_field.borderStyle = UITextBorderStyleRoundedRect
    @text_field.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter
    @text_field.textAlignment = UITextAlignmentCenter
    @text_field.text = "The Brave Sir Robin"
    @text_field.center = view.center
    view.addSubview(@text_field)
  end

  def char_counter(param_string)
    if param_string.length = 1
      @char_pluralization = "Character"
    end

    @charcount
  end
end
