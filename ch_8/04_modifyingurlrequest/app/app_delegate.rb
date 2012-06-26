class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.rootViewController = RootController.new

    url = NSURL.URLWithString("http://www.apple.com")
    request = NSMutableURLRequest.requestWithURL(url)
    # Setting the timeout after creation is the mutable trick here
    request.setTimeoutInterval(30)
    # Sorry, there's really nothing else to show here

    @window.makeKeyAndVisible
    true
  end
end

