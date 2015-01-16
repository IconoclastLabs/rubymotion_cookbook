class SecondNavController < UIViewController
  def viewDidLoad
    view.backgroundColor = UIColor.blueColor
    self.title = "Second Nav View"

    current_controllers = self.navigationController.viewControllers

    @label = UILabel.new
    @label.text = "viewController Count:  #{current_controllers.size}"
    @label.frame = [[50,50],[350,50]]
    view.addSubview(@label)

    @third_view = ThirdNavController.new
    self.navigationController.pushViewController(@third_view, animated: false)
  end
end
