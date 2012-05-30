class RootController < UIViewController
  def viewDidLoad
    view.backgroundColor = UIColor.lightGrayColor
   
    @label = UILabel.new
    @label.text = 'Accelerometer'
    @label.frame = [[0,50],[300,50]]
    view.addSubview(@label)

    motionManager = CMMotionManager.alloc.init

    if (motionManager.isAccelerometerAvailable)
      p "Accelerometer is available"
      @label.text = 'Accelerometer Available'

      if (motionManager.isAccelerometerActive)
        p "Accelerometer is active"
      else
        p "Accelerometer is not active"
      end

    else
      p "Accelerometer is not available: You're likely running this in a simulator"
      @label.text = "Accelerometer Not Available"
    end
  end

end
