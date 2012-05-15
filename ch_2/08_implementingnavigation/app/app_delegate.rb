class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    myImplNavController = ImplNavController.alloc.init
    @window.rootViewController = UINavigationController.alloc.initWithRootViewController(myImplNavController)
    @window.rootViewController.wantsFullScreenLayout = true
    @window.makeKeyAndVisible
    true
  end
end
