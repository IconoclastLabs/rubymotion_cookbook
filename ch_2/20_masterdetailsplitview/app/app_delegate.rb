#Taking a cue from Bubblewrap:
class Kernel
  def ipad?
    UIDevice.currentDevice.userInterfaceIdiom == UIUserInterfaceIdiomPad
  end
end

class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.makeKeyAndVisible
    if ipad?
      split_view = UISplitViewController.alloc.init
      nav_controller = UINavigationController.alloc.init 
      MyIpadController.alloc.init
    else
      MyIphoneController.alloc.init
    end
    true
  end
end
