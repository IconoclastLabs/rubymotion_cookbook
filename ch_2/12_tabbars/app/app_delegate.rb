class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.makeKeyAndVisible

    first_tab = FirstTabController.alloc.init
    second_tab = SecondTabController.alloc.init
    #first_nav = UINavigationController.alloc.initWithRootViewController(first_tab)
    #second_nav = UINavigationController.alloc.initWithRootViewController(second_tab)
    @tabbar = UITabBarController.alloc.init
    @tabbar.viewControllers = [first_tab, second_tab] 

    #@window.addSubview(tabbar.view)
    #navbar = UINavigationController.alloc.initWithRootViewController(tabbar.view)
    
    @tabbar.wantsFullScreenLayout = true
    @window.addSubview @tabbar.view
    true
  end
end
