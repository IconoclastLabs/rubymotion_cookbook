class GroupingOptionsController < UIViewController
  def viewDidLoad
    view.backgroundColor = UIColor.whiteColor
    options = ["iPhone","iPod","iPad","iMac"]
    @my_segmented_control = UISegmentedControl.alloc.initWithItems(options)
    @my_segmented_control.center = view.center
    view.addSubview(@my_segmented_control)
    @my_segmented_control.addTarget(self, action: :'segment_changed:', forControlEvents:UIControlEventValueChanged)
    @my_segmented_control.momentary = true
    @label = UILabel.new
    @label.text = 'Picker Results'
    @label.frame = [[0,0],[250,150]]
    view.addSubview(@label)
  end

  def segment_changed(sender)
    if(sender == @my_segmented_control)
      index = sender.selectedSegmentIndex
      segment_text = sender.titleForSegmentAtIndex(index)
      @label.text = segment_text
    end
  end
end
