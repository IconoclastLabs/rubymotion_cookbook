class PickingValuesController < UIViewController
  def viewDidLoad
    self.view.backgroundColor = UIColor.whiteColor
    @myPicker = UIPickerView.alloc.init
    @myPicker.dataSource = self
    @myPicker.center = self.view.center
    @myPicker.center = view.center

    self.view.addSubview(@myPicker)
  end

  def numberOfComponentsInPickerView pickerView
    1 
  end

  def pickerView(pickerView, numberOfRowsInComponent:component)
    10
  end

end
