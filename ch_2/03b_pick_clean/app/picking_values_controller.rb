class PickingValuesController < UIViewController
  def viewDidLoad
    self.view.backgroundColor = UIColor.whiteColor
    @myPicker = UIPickerView.new # same ass alloc.init
    @myPicker.showsSelectionIndicator = true
    @source = PickerCounter.new
    @myPicker.dataSource = @source
    @myPicker.delegate = @source
    @myPicker.center = self.view.center

    self.view.addSubview(@myPicker)
  end

end
