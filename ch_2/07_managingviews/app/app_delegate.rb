class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.rootViewController = NSBundle.mainBundle.loadNibNamed('ManagingViews', owner:self, options:nil).first
    @window.makeKeyAndVisible
    true
  end
end
