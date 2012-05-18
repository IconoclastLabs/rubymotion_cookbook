class FirstTabController < UIViewController
  def init
    if super 
      self.title = "First Tab"
      self.tabBarItem.image = UIImage.imageNamed('FirstTab.png')
    end
    self
  end 

  def viewDidLoad
    view.backgroundColor = UIColor.whiteColor
    @label = UILabel.new
    @label.text = 'First Tab'
    @label.frame = [[50,50],[250,50]]
    view.addSubview(@label)
  end
end
