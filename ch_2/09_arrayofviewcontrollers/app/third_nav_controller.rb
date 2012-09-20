class ThirdNavController < UIViewController
  def viewDidLoad
    view.backgroundColor = UIColor.greenColor
    self.title = "Third Nav View"

    current_controllers = self.navigationController.viewControllers

    @label = UILabel.new
    @label.text = "viewController Count:  #{current_controllers.size}"
    @label.frame = [[50,50],[350,50]]
    view.addSubview(@label)
  end
end
