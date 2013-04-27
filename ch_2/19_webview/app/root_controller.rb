class RootController < UIViewController
  def viewDidLoad
    super
    
    view.backgroundColor = UIColor.whiteColor
    @my_web_view = UIWebView.alloc.initWithFrame(view.bounds)
    @my_web_view.delegate = self
    @my_web_view.scalesPageToFit = false

    view.addSubview(@my_web_view)

    url = NSURL.URLWithString("http://www.Chatoms.com")
    request = NSURLRequest.requestWithURL(url)

    @my_web_view.loadRequest(request)
  end

  def webViewDidStartLoad(webView)
    UIApplication.sharedApplication.setNetworkActivityIndicatorVisible(true)
  end

  def webViewDidFinishLoad(webView)
    UIApplication.sharedApplication.setNetworkActivityIndicatorVisible(false)
  end

  def webView(webView, didFailLoadWithError:error)
    UIApplication.sharedApplication.setNetworkActivityIndicatorVisible(false)
  end
end
