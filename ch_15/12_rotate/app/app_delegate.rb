class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    #15.06 Hide status bar
    application.setStatusBarHidden(true, withAnimation:UIStatusBarAnimationNone)
    #normal stuffs
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.rootViewController = RootController.alloc.init
    @window.makeKeyAndVisible
    true
  end
end
