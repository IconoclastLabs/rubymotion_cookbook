class RootController < UIViewController
  def viewDidLoad
    view.backgroundColor = UIColor.whiteColor
    self.title = "Twitter Integration"
    # Word of advice: You'll need to sign into Twitter in the simulator for this to fully
    # function and this *will* actually post to that account.
    @twitter_controller = TWTweetComposeViewController.new
    @twitter_controller.addImage(UIImage.imageNamed("smilingbob.png"))
    @twitter_controller.addURL(NSURL.URLWithString("http://www.rubymotion.com/developer-center/"))
    @twitter_controller.setInitialText("RubyMotion is awesome.")
    self.navigationController.presentModalViewController(@twitter_controller, animated:true)
  end

  def viewDidUnload
    @twitter_controller = nil
  end
end
