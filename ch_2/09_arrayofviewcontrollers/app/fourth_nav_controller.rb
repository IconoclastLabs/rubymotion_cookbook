class FourthNavController < UIViewController
  def viewDidLoad
    view.backgroundColor = UIColor.purpleColor
    self.title = "Fourth Nav View"

    current_controllers = self.navigationController.viewControllers

    @label = UILabel.new
    @label.text = "viewController Count:  #{current_controllers.size}"
    @label.frame = [[50,50],[350,50]]
    view.addSubview(@label)
  end
end
