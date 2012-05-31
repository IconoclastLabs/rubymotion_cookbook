class RootController < UIViewController
  def viewDidLoad
    view.backgroundColor = UIColor.lightGrayColor
   
    @label = UILabel.new
    @label.text = 'Gyro'
    @label.frame = [[0,50],[UIScreen.mainScreen.bounds.size.width,50]]
    view.addSubview(@label)

    motionManager = CMMotionManager.alloc.init

    if (motionManager.isGyroAvailable)
      p "Gyro is available"
      @label.text = 'Accelerometer Available'

      if (motionManager.isGyroActive)
        p "Gyro is active"
      else
        p "Gyro is not active"
      end

    else
      p "Gyro is not available: You're likely running this in a simulator"
      @label.text = "Gyro Not Available"
    end
  end

end
