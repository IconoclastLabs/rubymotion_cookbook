class RootController < UIViewController
  def viewDidLoad
    view.backgroundColor = UIColor.lightGrayColor
   
    @label = UILabel.new
    @label.text = 'Gyro'
    @label.frame = [[0,50],[UIScreen.mainScreen.bounds.size.width,150]]
    @label.numberOfLines = 0
    view.addSubview(@label)

    @motionManager = CMMotionManager.alloc.init

    if (@motionManager.isGyroAvailable)
      if (@motionManager.isGyroActive)
        @label.text = "Gyro was active, so we passed up listening"
      else
        queue = NSOperationQueue.alloc.init
        @motionManager.startGyroUpdatesToQueue(queue, withHandler:handle_gyro)
      end
    else
      p "Gyro is not available: You're likely running this in a simulator"
      @label.text = "Gyro Not Available"
    end
  end

  def handle_gyro(gyroData, error)
    @label.text = "X = #{gyroData.rotationRate.x}, Y = #{gyroData.rotationRate.y}, Z = #{gyroData.rotationRate.z}"
    p @label.text
  end

  def viewDidUnload
    @motionManager = nil
  end

  def shouldAutorotateToInterfaceOrientation(interfaceOrientation)
    true
  end

end
