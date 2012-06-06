class Kernel
  def ipad?
    UIDevice.currentDevice.userInterfaceIdiom == UIUserInterfaceIdiomPad
  end

  def alert(title=nil, message=nil, delegate=nil, cancelButtonTitle=nil, otherButtonTitles=nil)
    alert = UIAlertView.alloc.initWithTitle title,
                                            message: message,
                                            delegate: delegate,
                                            cancelButtonTitle: cancelButtonTitle,
                                            otherButtonTitles: otherButtonTitles
    alert
  end
end

class PopoverController < UIViewController

  def init
    if super
      self.title = "Popover Example"
    end
    self
  end

  def loadView

  end

  def viewDidLoad
    view.backgroundColor = UIColor.whiteColor
    self.contentSizeForViewInPopover = CGSizeMake(200,125)
    buttonRect = CGRectMake(20,20,160,37)
    @photo_button = UIButton.buttonWithType(UIButtonTypeRoundedRect)
    @photo_button.setTitle("Photo", forState:UIControlStateNormal)
    @photo_button.addTarget(self, selector:"show_alert:", forControlEvents:UIControlEventTouchUpInside)
    @photo_button.frame = buttonRect
    view.addSubview(@photo_button)
    buttonRect.origin.y += 50
  end

  def viewDidUnload
    @photo_button = nil
  end

  def shouldAutorotateToInterfaceOrientation(orientation)
    'YES'
  end

  def in_popover?
    popover_class =  NSClassFromString("UIPopoverController")
    p "Popover Class"
    p popover_class
    p "iPad?"
    p ipad?
    p "popoverController"
    p self.popoverController
    if(popover_class != nil && ipad? && self.popoverController != nil)
      return 'YES'
    else
      return 'NO'
    end
  end

  def show_alert(sender)
    if(self.in_popover?)
      alert = alert("In a popover!", "Deal with it.")
      alert.alertViewStyle = UIAlertViewStyleDefault
      alert.show
      self.popoverController.dismissPopoverAnimated('YES')
    else

    end
  end
end
