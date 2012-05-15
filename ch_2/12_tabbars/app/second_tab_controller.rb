class SecondTabController < UIViewController
  def viewDidLoad
    view.backgroundColor = UIColor.whiteColor
    self.title = "Second Tab Controller"
    self.tabBarItem.image = UIImage.imageNamed('SecondTab.png')
    @label = UILabel.new
    @label.text = 'Second Tab Controller'
    @label.frame = [[50,50],[250,50]]
    view.addSubview(@label)
  end
end
