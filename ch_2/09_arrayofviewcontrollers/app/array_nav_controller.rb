class ArrayNavController < UIViewController
  def viewDidLoad
    view.backgroundColor = UIColor.whiteColor
    self.title = "Navigation Array"

    current_controllers = self.navigationController.viewControllers

    @label = UILabel.new
    @label.text = "viewController Count:  #{current_controllers.size}"
    @label.frame = [[50,50],[350,50]]
    view.addSubview(@label)
    
    # Not a bad practice to ||= here
    @second_view ||= SecondNavController.new # new is the same as alloc.init
    self.navigationController.pushViewController(@second_view, animated: true)

  end
end
