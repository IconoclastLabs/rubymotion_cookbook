class RootScreen < PM::Screen
	title "RedPotion " + NSBundle.mainBundle.infoDictionary['CFBundleDisplayName']
	stylesheet RootScreenStylesheet

	def on_load
		# @picker = append!(UIPickerView, :picker)

	end

end
