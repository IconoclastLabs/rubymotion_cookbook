class RootScreen < PM::Screen
	title "RedPotion " + NSBundle.mainBundle.infoDictionary['CFBundleDisplayName']
	stylesheet RootScreenStylesheet

	def on_load
    open_tab_bar FirstTabScreen.new(nav_bar:true), SecondTabScreen.new(nav_bar: true), ThirdTabScreen.new(nav_bar: true)
	end

end
