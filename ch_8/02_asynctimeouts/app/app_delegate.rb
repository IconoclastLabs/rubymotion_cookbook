class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.rootViewController = RootController.new

    url = NSURL.URLWithString("http://www.apple.com")
    request = NSURLRequest.requestWithURL(url,
                              cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData,
                          timeoutInterval:30)
    queue = NSOperationQueue.alloc.init

    NSURLConnection.sendAsynchronousRequest(request,
      queue: queue,
      completionHandler: lambda do |response, data, error|
        if(data.length > 0 && error.nil?)
          doc_dir = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                        NSUserDomainMask,
                                                        true).first
          #p doc_dir
          file_path = doc_dir.stringByAppendingPathComponent("apple.html")

          data.writeToFile(file_path, atomically: true)

          p "Saved file to #{file_path}"
        elsif( data.length == 0 && error.nil? )
          p "Nothing was downloaded"
        elsif(error?)
          p "Error: #{error}"
        end
      end)


    @window.makeKeyAndVisible
    true
  end
end

