class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.rootViewController = RootController.new

    url_string = "http://rubymotion-cookbook.herokuapp.com/put"
    post_body = "bodyParam1=BodyValue1&bodyParam2=BodyValue2"

    url = NSURL.URLWithString(url_string)
    request = NSMutableURLRequest.requestWithURL(url)
    request.timeoutInterval = 30
    request.HTTPMethod = "PUT"
    request.HTTPBody = post_body.dataUsingEncoding(NSUTF8StringEncoding)
    queue = NSOperationQueue.alloc.init

    NSURLConnection.sendAsynchronousRequest(request,
      queue: queue,
      completionHandler: lambda do |response, data, error|
        if(data.length > 0 && error.nil?)
          html = NSString.alloc.initWithData(data, encoding: NSUTF8StringEncoding)
          p "HTML = #{html}"
        elsif( data.length == 0 && error.nil? )
          p "Nothing was downloaded"
        elsif(!error.nil?)
          p "Error: #{error}"
        end
      end
    )


    @window.makeKeyAndVisible
    true
  end
end

