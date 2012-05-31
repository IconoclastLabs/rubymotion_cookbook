class RootController < UIViewController
  def viewDidLoad
    view.backgroundColor = UIColor.lightGrayColor
   
    @label = UILabel.new
    @label.text = 'Goto Hardware > Shake Gesture'
    @label.frame = [[0,50],[UIScreen.mainScreen.bounds.size.width,50]]
    view.addSubview(@label)

  end

  def shake_event
    now = Time.new
    @label.text = "Got shook " + now.strftime("%H:%M:%S")
  end

end
