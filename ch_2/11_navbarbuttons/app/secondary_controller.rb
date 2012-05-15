class SecondaryController < UIViewController
  def viewDidLoad
    view.backgroundColor = UIColor.whiteColor
    self.title = "Navbar Buttons 2"
    @label = UILabel.new
    @label.text = 'Secondary Controller'
    @label.frame = [[50,50],[250,50]]
    view.addSubview(@label)

    @nav_bar_button = UIBarButtonItem.alloc.init
    @nav_bar_button.title = 'Main'
    @nav_bar_button.style = UIBarButtonItemStylePlain
    @nav_bar_button.target = self
    @nav_bar_button.action = 'performBack'
    self.navigationItem.leftBarButtonItem = @nav_bar_button

    @nav_add_button = UIBarButtonItem.alloc.initWithBarButtonSystemItem(UIBarButtonSystemItemAdd, target:self, action:'performAdd')
    self.navigationItem.rightBarButtonItem = @nav_add_button

  end

  def performBack
    @nav_controller = NavController.alloc.init
    self.navigationController.pushViewController(@nav_controller, animated:'YES')
  end
  
  def performAdd
    @label.text = 'Attempted to Add'
  end
end

