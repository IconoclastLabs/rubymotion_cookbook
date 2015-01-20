class RootScreen < PM::Screen
	title "RedPotion Buttons"
	stylesheet RootScreenStylesheet

	def on_load
		append(UIButton, :reg_button).on(:tap) do |sender|
			mp "Button was tapped"
		end.on(:touch_down) do |sender|
			mp "Button was pressed"
		end

		append(UIButton, :img_button).on(:tap) do |sender|
			mp "Button was tapped"
		end.on(:touch_down) do |sender|
			mp "Button was pressed"
		end

	end
end
