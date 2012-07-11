class AddPersonViewController < UIViewController
  def viewDidLoad
    super

    self.title = "New Person"
    @textFieldFirstName = UITextField.alloc.initWithFrame([[20,20],[view.bounds.size.width - 40.0, 31]])
    @textFieldFirstName.placeholder = "First Name"
    @textFieldFirstName.borderStyle = UITextBorderStyleRoundedRect
    @textFieldFirstName.autoresizingMask = UIViewAutoresizingFlexibleWidth
    @textFieldFirstName.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter
    view.addSubview(@textFieldFirstName)

    newFrame = @textFieldFirstName.frame
    newFrame.origin.y += 37.0
    @textFieldLastName = UITextField.alloc.initWithFrame(newFrame)
    @textFieldLastName.placeholder = "Last Name"
    @textFieldLastName.borderStyle = UITextBorderStyleRoundedRect
    @textFieldLastName.autoresizingMask = UIViewAutoresizingFlexibleWidth
    @textFieldLastName.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter
    view.addSubview(@textFieldLastName)
    
    newFrame.origin.y += 37.0
    @textFieldAge = UITextField.alloc.initWithFrame(newFrame)
    @textFieldAge.placeholder = "Age"
    @textFieldAge.borderStyle = UITextBorderStyleRoundedRect;
    @textFieldAge.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    @textFieldAge.keyboardType = UIKeyboardTypeNumberPad;
    @textFieldAge.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter
    view.addSubview(@textFieldAge)
    
    @barButtonAdd = UIBarButtonItem.alloc.initWithTitle("Add", style:UIBarButtonItemStylePlain, target:self, action:'createNewPerson:')
    self.navigationItem.setRightBarButtonItem(@barButtonAdd, animated:false);
    
  end

  def createNewPerson paramSender
    newPerson = NSEntityDescription.insertNewObjectForEntityForName("Person", inManagedObjectContext:$context)

    unless newPerson.nil?
      newPerson.firstName = @textFieldFirstName.text
      newPerson.lastName = @textFieldLastName.text
      newPerson.age = NSNumber.numberWithInteger(@textFieldAge.text.integerValue)

      savingError = Pointer.new(:object)
      if $context.save(savingError)
        p "Saved new"
        self.navigationController.popViewControllerAnimated(true)
      else
        p "Failed to save the managed object context"
      end
    else
      p "Failed to create the new person object"
    end
  end

  def viewDidAppear paramAnimated
    super
    @textFieldFirstName.becomeFirstResponder
  end
end 
