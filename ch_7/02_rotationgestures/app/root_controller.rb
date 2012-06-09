class RootController < UIViewController
  def viewDidLoad
    view.backgroundColor = UIColor.whiteColor

    @label = UILabel.alloc.initWithFrame(CGRectZero)
    @label.text = "Hello World"
    @label.font = UIFont.systemFontOfSize(16)
    @label.sizeToFit
    @label.center = view.center
    view.addSubview(@label)
    @rotationAngleInRadians = 0
    @rotation_gesture_recognizer = UIRotationGestureRecognizer.alloc.initWithTarget(self, action:"handle_rotations:")
    view.addGestureRecognizer(@rotation_gesture_recognizer)
  end

  def viewDidUnload
    @rotation_gesture_recognizer = nil
    @label = nil
  end

  def handle_rotations(sender)
    if(@label == nil)
      return
    end

    @label.transform = CGAffineTransformMakeRotation(@rotationAngleInRadians + sender.rotation)

    if(sender.state == UIGestureRecognizerStateEnded)
      @rotationAngleInRadians += sender.rotation
    end

  end
end
