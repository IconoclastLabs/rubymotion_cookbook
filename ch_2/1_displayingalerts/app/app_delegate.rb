class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    alert = alert("Ackbar says:", "It's a trap!", nil, "Cancel","OK")
    alert.show
    true
  end
end

module Kernel
  def alert(title=nil, message=nil, delegate=nil, cancelButtonTitle=nil, otherButtonTitles=nil)
    alert = UIAlertView.alloc.initWithTitle title,
                                            message: message,
                                            delegate: delegate,
                                            cancelButtonTitle: cancelButtonTitle,
                                            otherButtonTitles: otherButtonTitles
    alert
  end
end
