class ImplNavController < UIViewController
  def viewDidLoad
    view.backgroundColor = UIColor.whiteColor
    self.title = "Navigation Example"

    @label = UILabel.new
    @label.text = 'First View Controller'
    @label.frame = [[50,50],[250,50]]
    view.addSubview(@label)
   
    # Push after 5 second (this is what the book did)
    self.performSelector('push_second_controller:', withObject:nil, afterDelay: 5)

    #allow user to force it... why wait right?
    self.navigationItem.rightBarButtonItem = UIBarButtonItem.alloc.initWithBarButtonSystemItem(UIBarButtonSystemItemAdd, target:self, action: 'push_second_controller:')
    
  end

  def push_second_controller(param)
    @secondViewController = SecondViewController.alloc.init
    self.navigationController.pushViewController(@secondViewController, animated:'YES')
  end

end

