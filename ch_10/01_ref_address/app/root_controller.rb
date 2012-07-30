class RootController < UIViewController
  def viewDidLoad
    view.backgroundColor = UIColor.lightGrayColor
   
    @label = UILabel.new
    @label.text = 'Address Book'
    @label.frame = [[0,50],[UIScreen.mainScreen.bounds.size.width,50]]
    view.addSubview(@label)

    address_book = ABAddressBookCreate()

    unless address_book.nil?
      @label.text = "Address book successfully created!"
      p @label.text

      if ABAddressBookHasUnsavedChanges(address_book)
        @label.text = "Unsaved changes!"
        p @label.text
        save_changes = true

        if save_changes
          save_error = Pointer.new(:object)

          if ABAddressBookSave(address_book, save_error)
            p "Successfully saved"
          else
            p "Failed to save!"
          end
        else
          p "You didn't want to save changes"
          ABAddressBookRevert(address_book)
        end
      else
        @label.text = "No unsaved changes"
        p @label.text
      end
    else
      @label.text = "Could not access address book"
      p @label.text
    end
  end

end
