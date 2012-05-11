class PickingValuesController < UIViewController
  def viewDidLoad
    view.backgroundColor = UIColor.whiteColor
    @myPicker = UIPickerView.alloc.init titleForRow: 1
    @myPicker.dataSource = self
    @myPicker.center = view.center

    view.addSubview(@myPicker)
  end

  def pickerView
    if pickerView.equal = @myPicker
      result = "Row #{row+1}"
    end
    result
  end


end
