class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = ShakeWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.rootViewController = RootController.alloc.init
    @window.makeKeyAndVisible
    true
  end
end
