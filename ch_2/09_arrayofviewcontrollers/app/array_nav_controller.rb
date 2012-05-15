class ArrayNavController < UIViewController
  def viewDidLoad
    view.backgroundColor = UIColor.whiteColor
    self.title = "Navigation Array"

    current_controllers = self.navigationController.viewControllers

    @label = UILabel.new
    @label.text = "viewController Count:  #{current_controllers.size}"
    @label.frame = [[50,50],[350,50]]
    view.addSubview(@label)
    
    @second_view = SecondNavController.alloc.init
    self.navigationController.pushViewController(@second_view, animated:'YES')

  end
end
