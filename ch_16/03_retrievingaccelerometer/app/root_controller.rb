class RootController < UIViewController
  def viewDidLoad
    view.backgroundColor = UIColor.lightGrayColor
   
    @label = UILabel.new
    @label.text = 'Accelerometer'
    @label.frame = [[0,50],[UIScreen.mainScreen.bounds.size.width,150]]
    @label.numberOfLines = 0
    view.addSubview(@label)

    @motionManager = CMMotionManager.alloc.init

    if (@motionManager.isAccelerometerAvailable)
      queue = NSOperationQueue.alloc.init
      @motionManager.startAccelerometerUpdatesToQueue(queue, withHandler:handle_motion)
    else
      p "Accelerometer is not available: You're likely running this in a simulator"
      @label.text = "Accelerometer Not Available"
    end
  end

  def handle_motion(accelerometerData, error)
    @label.text = "X = #{accelerometerData.acceleration.x}, Y = #{accelerometerData.acceleration.y}, Z = #{accelerometerData.acceleration.z}"
    p @label.text
  end

  def viewDidUnload
    @motionManager = nil
  end

  def shouldAutorotateToInterfaceOrientation(interfaceOrientation)
    true
  end

end
