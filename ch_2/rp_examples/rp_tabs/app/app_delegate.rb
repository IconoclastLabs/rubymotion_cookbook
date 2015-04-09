class AppDelegate < PM::Delegate
  status_bar true, animation: :fade

  def on_load(app, options)
    
    open_tab_bar FirstTabScreen.new(nav_bar:true), SecondTabScreen.new(nav_bar: true), ThirdTabScreen.new(nav_bar: true)
    
    # Load tab bar from controller is the same code!
    #open RootScreen
  end
end