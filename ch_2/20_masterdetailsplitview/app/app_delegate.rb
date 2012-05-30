#Taking a cue from Bubblewrap:
class Kernel
  def ipad?
    UIDevice.currentDevice.userInterfaceIdiom == UIUserInterfaceIdiomPad
  end
end

# following code is mostly a clone from macfanatic on github
class AppDelegate

  def application(application, didFinishLaunchingWithOptions:launchOptions)
    window.makeKeyAndVisible
    true
  end

  def window
    @window ||= begin
      w = UIWindow.alloc.initWithFrame UIScreen.mainScreen.bounds
      if ipad?
        w.rootViewController = split_view_controller
      else
        p "You should be running this on an iPad forealz"
        #w.rootViewController = MyIphoneController 
      end
      w
    end
  end

  def split_view_controller
    @split_view_controller ||= begin
      s = UISplitViewController.alloc.init
      s.viewControllers = [UINavigationController.alloc.initWithRootViewController(DetailViewController.new), UINavigationController.alloc.initWithRootViewController(MyIpadController.new)]
      s.delegate = self
      s
    end
  end

  def splitViewController(sc, shouldHideController:c, inOrientation:o)
    p "splitViewController: #{c}, #{o}"
    false
  end

end
