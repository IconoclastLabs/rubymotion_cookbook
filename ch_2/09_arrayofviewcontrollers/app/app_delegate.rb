class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    myArrayNavController = ArrayNavController.alloc.init
    @window.rootViewController = UINavigationController.alloc.initWithRootViewController(myArrayNavController)
    @window.rootViewController.wantsFullScreenLayout = true
    @window.makeKeyAndVisible
    true
  end
end
