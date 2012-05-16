class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.makeKeyAndVisible

    first_tab = FirstTabController.alloc.init
    second_tab = SecondTabController.alloc.init
    @tabbar = UITabBarController.alloc.init
    @tabbar.viewControllers = [first_tab, second_tab] 
    
    @tabbar.wantsFullScreenLayout = true
    @window.addSubview @tabbar.view
    true
  end
end
