class RootController < UIViewController

  def alertView(alertView, didDismissWithButtonIndex:buttonIndex)
    buttonTitle = alertView.buttonTitleAtIndex(buttonIndex)
    
    if buttonTitle == @photoButtonTitle
      p "Add photo button"
    elsif buttonTitle == @audioButtonTitle
      p "Add audio button"
    else
      p "Cancel"
    end
  end

  def performAddWithAlertView(paramSender)
    p "Performing alert view"
    UIAlertView.alloc.initWithTitle(nil, message:"Add...", delegate:self, cancelButtonTitle:"Cancel", otherButtonTitles:@photoButtonTitle, @audioButtonTitle,nil).show
  end

  def performAddWithPopover(paramSender)
    p "Performing popover"
    #@popoverController.presentPopoverFromBarButtonItem(@barButtonAdd, permittedArrowDirections:UIPopoverArrowDirectionAny, animated:true)
  end

  def viewDidLoad
    super

    self.title = "Popover Example"
    
    @photoButtonTitle = "Photo"
    @audioButtonTitle = "Audio"
    popoverClass = NSClassFromString("UIPopoverController")
    # not supported and on ipad?
    unless popoverClass.nil? || UIDevice.currentDevice.userInterfaceIdiom != UIUserInterfaceIdiomPad
      p "Should be able to handle popovers"
      view.backgroundColor = UIColor.lightGrayColor
      #content = PopoverController.alloc.init
      #@popoverController = UIPopoverController.alloc.initWithContentViewController(content)
      @barButtonAdd = UIBarButtonItem.alloc.initWithBarButtonSystemItem(UIBarButtonSystemItemAdd, target:self, action:'performAddWithPopover:')
    else
      p "Popovers are not supported"
      @barButtonAdd = UIBarButtonItem.alloc.initWithBarButtonSystemItem(UIBarButtonSystemItemAdd, target:self, action:'performAddWithAlertView:')
    end

    self.navigationItem.setRightBarButtonItem(@barButtonAdd, animated:false)
  end

  def viewDidUnload
    super
    @barButtonAdd = nil
  end

  def shouldAutorotateToInterfaceOrientation(orientation)
    true
  end

end
