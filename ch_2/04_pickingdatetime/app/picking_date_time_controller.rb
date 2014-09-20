class PickingDateTimeController < UIViewController
  def viewDidLoad
    super
    view.backgroundColor = UIColor.whiteColor
    @myDatePicker = UIDatePicker.alloc.init
    @myDatePicker.center = view.center
    @myDatePicker.addTarget(self, action:'datePickerChanged', forControlEvents:UIControlEventValueChanged)
    @myDatePicker.datePickerMode = UIDatePickerModeDateAndTime
    view.addSubview(@myDatePicker)


    @label = UILabel.new
    @label.text = 'Picker Results'
    @label.frame = [[0,0],[250,150]]
    view.addSubview(@label)
  end

  def datePickerChanged
    @label.text = "Event: #{@myDatePicker.date}"
  end
end
