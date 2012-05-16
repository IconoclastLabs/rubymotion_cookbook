class RootController < UIViewController
  def viewDidLoad
    view.backgroundColor = UIColor.whiteColor

    @my_text_field = UITextField.alloc.initWithFrame([[0,0],[100,31]])
    @my_text_field.borderStyle = UITextBorderStyleRoundedRect
    @my_text_field.textAlignment = UITextAlignmentLeft
    @my_text_field.text = "Enter text..."
    @my_text_field.delegate = self
    view.addSubview(@my_text_field)

    @char_pluralization = "Characters"
    @charcount = UITextField.alloc.initWithFrame([[0,0],[200,31]])
    @charcount.borderStyle = UITextBorderStyleBezel
    @charcount.textAlignment = UITextAlignmentCenter
    @charcount.text = "0 Characters"
    @charcount.center = view.center
    view.addSubview(@charcount)
    self.calculateAndDisplayTextFieldLengthWithText(@my_text_field.text)

  end


  def textField(shouldChangeCharactersInRange, replacementString:string)
    result = 'YES'
    if textField = @my_text_field
      wholeText = textField.text stringReplacingCharactersInRange(range, withString:string)
      self.calculateAndDisplayTextFieldLengthWithText.wholeText
    end
    result
  end

  def textFieldShouldReturn textField
    textField.resignFirstResponder
   'YES'
  end



  def calculateAndDisplayTextFieldLengthWithText(param_string)
    @char_pluralization = "Character" if param_string.size == 1
    @char_count.text = "#{param_string} #{@char_pluralization}"
  end
end
