class MyIpadController < UIViewController
  def viewDidLoad
    view.backgroundColor = UIColor.greenColor
    navigationItem.title = "Right Pane"
    @label = UILabel.alloc.init
    @label.text = "Only iPads see this"
    @label.frame = [[0,0],[250,150]]
    view.addSubview(@label)
  end
end
