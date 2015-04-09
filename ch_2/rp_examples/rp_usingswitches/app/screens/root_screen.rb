class RootScreen < PM::Screen
	title "RedPotion Switches"
	stylesheet RootScreenStylesheet

	def on_load
		@label = append!(UILabel, :status_label)
		append(UISwitch, :switchy).on(:change) do |sender|
			@label.text = sender.on? ? 'On' : 'Off'
		end
	end
end
