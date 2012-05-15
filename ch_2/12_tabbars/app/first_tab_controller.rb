class FirstTabController < UIViewController
  def viewDidLoad
    view.backgroundColor = UIColor.whiteColor
    self.title = "First Tab"
    self.tabBarItem.image = UIImage.imageNamed('FirstTab.png')
    @label = UILabel.new
    @label.text = 'First Tab'
    @label.frame = [[50,50],[250,50]]
    view.addSubview(@label)
  end
end
