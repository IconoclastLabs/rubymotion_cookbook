class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.rootViewController = RootController.new

    url = NSURL.URLWithString("http://www.yahoo.com")
    request = NSURLRequest.requestWithURL(url)

    response = nil
    error = nil
    data = NSURLConnection.sendSynchronousRequest(request, returningResponse: response, error: error)

    if(data.length > 0 && error.nil?)
      p "#{data.length} bytes of data was returned."
    elsif( data.length == 0 && error.nil? )
      p "Nothing was downloaded"
    elsif(!error.nil?)
      p "Error: #{error}"
    end


    @window.makeKeyAndVisible
    true
  end
end
