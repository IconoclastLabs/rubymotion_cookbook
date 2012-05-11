class PickingValuesController < UIViewController
  def viewDidLoad
    view.backgroundColor = UIColor.whiteColor
    @myPicker = UIPickerView.alloc.init
    @myPicker.center = view.center

    view.addSubview(@myPicker)
  end
end
