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

      array_of_people = ABAddressBookCopyArrayOfAllPeople(address_book)

      array_of_people.each_with_index do |person, index|
        first_name = Pointer.new(:object)
        first_name = ABRecordCopyValue(person, KABPersonFirstNameProperty)
        last_name = Pointer.new(:object)
        last_name = ABRecordCopyValue(person, KABPersonLastNameProperty)
        address = Pointer.new(:object)
        address = ABRecordCopyValue(person, KABPersonEmailProperty)
        p "Person #{index + 1}: Retrieved"
        p "First Name = #{first_name}"
        p "Last Name = #{last_name}"
        p "Address = #{address}"
        p " -- "
      end

      @label.text = "#{array_of_people.count} person(s) in address book"
      p @label.text
    else
      @label.text = "Could not access address book"
      p @label.text
    end
  end

end
