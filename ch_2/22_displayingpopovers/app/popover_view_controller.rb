class PopoverController < UIViewController

  def isInPopover
    popoverClass = NSClassFromString("UIPopoverController")

    answer = (popoverClass.nil?) ? (false) : (true)
    answer
  end

  def gotoAppleWebsite paramSender
    if self.isInPopover
      self.popoverController.dismissPopoverAnimated(true)
    else
      p "iphone"
    end
  end

  def gotoAppleStoreWebsite paramSender
    if self.isInPopover
      self.popoverController.dismissPopoverAnimated(true)
    else
      p "iphone"
    end
  end

  def viewDidLoad
    super

    view.backgroundColor = UIColor.whiteColor
    self.contentSizeForViewInPopover = CGSizeMake(200.0, 125.0)

    buttonRect = [[20, 20],[160, 37]]
    @buttonPhoto = UIButton.buttonWithType(UIButtonTypeRoundedRect)
    @buttonPhoto.setTitle("Photo", forState:UIControlStateNormal)
    @buttonPhoto.addTarget(self, action:'gotoAppleWebsite:', forControlEvents:UIControlEventTouchUpInside)
    @buttonPhoto.frame = buttonRect
    view.addSubview(@buttonPhoto)

    newRect = [[20, 70], [160, 37]]
    @buttonAudio = UIButton.buttonWithType(UIButtonTypeRoundedRect)
    @buttonAudio.setTitle("Audio", forState:UIControlStateNormal)
    @buttonAudio.addTarget(self, action:'gotoAppleStoreWebsite:', forControlEvents:UIControlEventTouchUpInside)
    @buttonAudio.frame = newRect
    view.addSubview(@buttonAudio)
  end

  def viewDidUnload
    @buttonPhoto = nil
    @buttonAudio = nil
  end

  def shouldAutorotateToInterfaceOrientation
    true
  end

end
