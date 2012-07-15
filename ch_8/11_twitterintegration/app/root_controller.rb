class RootController < UIViewController
  def viewDidLoad
    view.backgroundColor = UIColor.whiteColor
    self.title = "Twitter Integration"
    @twitter_controller = TWTweetComposeViewController.new
    @twitter_controller.setInitialText("Sample tweet from RubyMotion")
    self.navigationController.presentModalViewController(@twitter_controller, animated:true)
  end

  def viewDidUnload

  end
end
