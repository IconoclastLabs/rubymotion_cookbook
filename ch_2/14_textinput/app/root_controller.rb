class RootController < UIViewController
  def viewDidLoad
    super
    view.backgroundColor = UIColor.whiteColor

    @my_text_field = UITextField.alloc.initWithFrame([[38.0,30.0],[220.0,31.0]])
    @my_text_field.borderStyle = UITextBorderStyleRoundedRect
    @my_text_field.textAlignment = UITextAlignmentLeft
    @my_text_field.text = "Enter text..."
    @my_text_field.delegate = self
    view.addSubview(@my_text_field)

    labelCounterFrame = @my_text_field.frame
    labelCounterFrame.origin.y += labelCounterFrame.size.height + 10
    @charcount = UITextField.alloc.initWithFrame(labelCounterFrame)
    @charcount.borderStyle = UITextBorderStyleBezel
    @charcount.textAlignment = UITextAlignmentCenter
    @charcount.text = "0 Characters"
    view.addSubview(@charcount)
    self.calculateAndDisplayTextFieldLengthWithText(@my_text_field.text)
  end

  def textField(textField, shouldChangeCharactersInRange:range, replacementString:string)
    if textField.isEqual(@my_text_field)
      # IMPORTANT NOTE:  You can't just use @my_text_field in your function here because this delegate is called
      # BEFORE the value is placed in the UITextField.  Therefore using @my_text_field would always give you
      # the size of the field on last edit/paste, and be forever behind by 1 event.
      wholeText = textField.text.stringByReplacingCharactersInRange(range, withString:string)
      self.calculateAndDisplayTextFieldLengthWithText(wholeText)
    end
    true
  end

  def textFieldShouldReturn textField
    textField.resignFirstResponder
    true
  end

  def calculateAndDisplayTextFieldLengthWithText(paramText)
    char_pluralization = (paramText.length == 1) ? ("Character") : ("Characters")
    @charcount.text = "#{paramText.length} #{char_pluralization}"
  end
end
