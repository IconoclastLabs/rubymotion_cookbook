class UsingSwitchesController < UIViewController
  def viewDidLoad
    view.backgroundColor = UIColor.whiteColor
   
    @label = UILabel.new
    @label.text = 'Switch Status'
    @label.frame = [[50,50],[150,50]]
    view.addSubview(@label)

    @switch = UISwitch.alloc.initWithFrame([[100, 100], [0, 0]])
    @switch.addTarget(self,action:'switchIsChanged', forControlEvents:UIControlEventValueChanged)
    view.addSubview(@switch)    
  end

  def switchIsChanged
    if @switch.on?
      @label.text = 'On'
    else
      @label.text = 'Off'
    end
  end

end
