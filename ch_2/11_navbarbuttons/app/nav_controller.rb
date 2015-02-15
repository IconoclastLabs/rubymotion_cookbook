class NavController < UIViewController
  def viewDidLoad
    view.backgroundColor = UIColor.whiteColor
    self.title = "Navbar Buttons"
    @label = UILabel.new
    @label.text = 'NavController'
    @label.frame = [[50,50],[250,50]]
    view.addSubview(@label)

    @nav_bar_button = UIBarButtonItem.alloc.init
    @nav_bar_button.title = 'Add'
    @nav_bar_button.style = UIBarButtonItemStylePlain
    @nav_bar_button.target = self
    @nav_bar_button.action = 'performAdd'
    self.navigationItem.rightBarButtonItem = @nav_bar_button
  end

  def performAdd
    @secondary_controller = SecondaryController.alloc.init
    self.navigationController.pushViewController(@secondary_controller, animated: true)
  end

end

