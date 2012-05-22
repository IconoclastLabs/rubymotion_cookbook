class RootController < UIViewController
  def viewDidLoad
    super
    
    view.backgroundColor = UIColor.whiteColor
    @my_web_view = UIWebView.alloc.initWithFrame(view.bounds)
    @my_web_view.delegate = self
    @my_web_view.scalesPageToFit = 'YES'

    view.addSubview(@my_web_view)

    url = NSURL.URLWithString("http://www.Chatoms.com")
    request = NSURLRequest.requestWithURL(url)

    @my_web_view.loadRequest(request)
  end

  def webViewDidStartLoad(webView)
    UIApplication.sharedApplication.setNetworkActivityIndicatorVisible('YES')
  end

  def webViewDidFinishLoad(webView)
    UIApplication.sharedApplication.setNetworkActivityIndicatorVisible('NO')
  end

  def webView(webView, didFailLoadWithError:error)
    UIApplication.sharedApplication.setNetworkActivityIndicatorVisible('NO')
  end
end
