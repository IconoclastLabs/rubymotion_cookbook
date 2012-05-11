class UsingSwitchesController < UIViewController
  def viewDidLoad
    view.backgroundColor = UIColor.whiteColor
    
    switch = UISwitch.alloc.initWithFrame(CGRectMake(100,100,0,0))
    view.addSubview(switch)
  end
end
