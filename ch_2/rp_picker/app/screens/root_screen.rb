class RootScreen < PM::Screen
	title "RedPotion Switches"
	stylesheet RootScreenStylesheet

	def on_load
		@picker = append!(UIPickerView, :picker)
		@picker.delegate = self
		@picker.dataSource = self
	end

	  # Necessary to implement these methods in order to be a datasource
  # - (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView;
  def numberOfComponentsInPickerView pickerView
    1
  end

  # - (NSInteger)pickerView:(UIPickerView *)pickerView
  # numberOfRowsInComponent:(NSInteger)component;
  def pickerView(pickerView, numberOfRowsInComponent:component)
    10
  end

  def pickerView(pickerView, titleForRow:row, forComponent:component)
  	"I can count to #{row+1}"
  end

end
