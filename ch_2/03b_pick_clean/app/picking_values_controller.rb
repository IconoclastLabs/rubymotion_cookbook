class PickingValuesController < UIViewController
  def viewDidLoad
    self.view.backgroundColor = UIColor.whiteColor
    @myPicker = UIPickerView.new # same ass alloc.init
    @myPicker.showsSelectionIndicator = true
    @myPicker.dataSource = PickerCounter
    @myPicker.delegate = PickerCounter
    @myPicker.center = self.view.center

    self.view.addSubview(@myPicker)
  end

end
