class RootScreen < PM::Screen
	title "RedPotion " + NSBundle.mainBundle.infoDictionary['CFBundleDisplayName']
	stylesheet RootScreenStylesheet

	def on_load
		# @picker = append!(UIPickerView, :picker)

    @date_picker = append!(UIDatePicker, :date_picker_style)
    @date_picker.addTarget(self, action:'datePickerChanged', forControlEvents:UIControlEventValueChanged)

    @label = append!(UILabel, :sexy_label)

  end
end
