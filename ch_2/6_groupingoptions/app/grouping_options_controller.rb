class GroupingOptionsController < UIViewController
  def viewDidLoad
    view.backgroundColor = UIColor.whiteColor
    options = ["iPhone","iPod","iPad","iMac"]
    @mySegmentedControl = UISegmentedControl.alloc.initWithItems(options)
    @mySegmentedControl.center = view.center
    view.addSubview(@mySegmentedControl)
  end
end
