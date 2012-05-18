class SecondTabController < UIViewController
  def init
    if super
      self.title = "Second Tab Controller"
      self.tabBarItem.image = UIImage.imageNamed('SecondTab.png')
    end
    self
  end

  def viewDidLoad
    view.backgroundColor = UIColor.whiteColor
    @label = UILabel.new
    @label.text = 'Second Tab Controller'
    @label.frame = [[50,50],[250,50]]
    view.addSubview(@label)
  end
end
