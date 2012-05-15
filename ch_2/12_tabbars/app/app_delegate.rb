class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    tabbar = UITabBarController.alloc.init
    tabbar.viewControllers = [FirstTabController.alloc.init, SecondTabController.alloc.init]
    tabbar.selectedIndex = 0

    navbar = UINavigationController.alloc.initWithRootViewController(tabbar)
    
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.rootViewController = navbar
    @window.rootViewController.wantsFullScreenLayout = true
    @window.makeKeyAndVisible
    true
  end
end
