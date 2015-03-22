class RootScreen < PM::Screen
	title "RedPotion Static Text"
	stylesheet RootScreenStylesheet

	def on_load
		@label = append!(UILabel, :status_label)
	end
end
