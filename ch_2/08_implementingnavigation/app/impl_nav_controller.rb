class ImplNavController < UIViewController
  def viewDidLoad
    view.backgroundColor = UIColor.whiteColor
    self.title = "Navigation Example"

    @label = UILabel.new
    @label.text = 'First View Controller'
    @label.frame = [[50,50],[250,50]]
    view.addSubview(@label)
   
    @secondViewController = SecondViewController.alloc.init
    self.navigationController.pushViewController(@secondViewController, animated:'YES')
    #self.pushViewController = @secondViewController
    
  end

end

