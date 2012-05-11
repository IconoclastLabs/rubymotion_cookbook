class PickingDateTimeController < UIViewController
  def viewDidLoad
    view.backgroundColor = UIColor.whiteColor
    @myDatePicker = UIDatePicker.alloc.init
    @myDatePicker.center = view.center
    # @myDatePicker.addTarget(self, action:'datePickerChanged', forControlEvents:UIControlEventValueChanged)
     @myDatePicker.datePickerMode = UIDatePickerDateAndTime
    view.addSubview(@myDatePicker)


    #@label = UILabel.new
    #@label.text = 'Picker Results'
    #@label.frame = [[0,0],[50,50]]
    #view.addSubview(@label)
  end

#  def datePickerChanged
#    date = @myDatePicker.date
#    @label.text = date
#  end
end
