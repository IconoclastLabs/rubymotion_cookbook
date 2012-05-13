class GroupingOptionsController < UIViewController
  def viewDidLoad
    view.backgroundColor = UIColor.whiteColor
    options = ["iPhone","iPod","iPad","iMac"]
    @mySegmentedControl = UISegmentedControl.alloc.initWithItems(options)
    @mySegmentedControl.addTarget(self, action:'segmentChanged', forControlEvents:UIControlEventValueChanged)
    @mySegmentedControl.center = view.center
    view.addSubview(@mySegmentedControl)

    @label = UILabel.new
    @label.text = 'Picker Results'
    @label.frame = [[0,0],[250,150]]
    view.addSubview(@label)
  end

  def segmentChanged(sender)
    @label.text = sender.selectedSegmentIndex
  end


end
