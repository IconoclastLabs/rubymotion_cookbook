class RootViewController < UINavigationController

  def viewDidLoad
    if ipad?
      content = PopoverController.new
      self.popoverController = UIPopoverController.alloc.initWithContent(content)
      content.popoverController = self.popoverController
      @barButtonAdd = UIBarButtonItem.alloc.initWithBarButtonSystemItem(UIBarButtonSystemItemAdd, target:self, action:"perform_add_with_popover")
    else
      p "Do nothing for iPhones since I'm lazy"
    end
    self.navigationItem.setRightBarButtonItem(@barButtonAdd, animated:'NO')
  end

  def viewDidUnload
    self.barButtonAdd = nil
  end


  def shouldAutorotateToInterfaceOrientation(orientation)
    'YES'
  end
end
