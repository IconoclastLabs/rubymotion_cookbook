class PickingValuesController < UIViewController
  def viewDidLoad
    view.backgroundColor = UIColor.whiteColor
    @myPicker = UIPickerView.alloc.init
    @myPicker.dataSource = self
    @myPicker.center = view.center
    view.addSubview(@myPicker)
  end
end
