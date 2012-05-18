class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.makeKeyAndVisible
    firstController = FirstController.new
    @window.rootViewController = firstController 
    @window.rootViewController.wantsFullScreenLayout = true
    true
  end
end
