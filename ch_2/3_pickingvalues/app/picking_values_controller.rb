class PickingValuesController < UIViewController
  def viewDidLoad
    self.view.backgroundColor = UIColor.whiteColor
    @myPicker = UIPickerView.alloc.init
    @myPicker.showsSelectionIndicator = true
    @myPicker.dataSource = self
    @myPicker.delegate = self
    @myPicker.center = self.view.center
    @myPicker.center = view.center

    self.view.addSubview(@myPicker)
  end

  # Necssary to have these method in order to be a datasource
  def numberOfComponentsInPickerView pickerView
    1 
  end

  def pickerView(pickerView, numberOfRowsInComponent:component)
    10
  end

  def pickerView(pickerView, titleForRow:row, forComponent:component)
    "I can count to #{row+1}"
  end

end
