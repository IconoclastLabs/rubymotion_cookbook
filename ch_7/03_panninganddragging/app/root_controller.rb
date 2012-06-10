class RootController < UIViewController
  def viewDidLoad
    view.backgroundColor = UIColor.whiteColor
    label_frame = CGRectMake(0, # X
                             0, # Y
                             150, #width
                             100) #height
    @hello_world_label = UILabel.alloc.initWithFrame(label_frame)
    @hello_world_label.text = "Hello World"
    @hello_world_label.backgroundColor = UIColor.blackColor
    @hello_world_label.textColor = UIColor.whiteColor
    @hello_world_label.textAlignment = UITextAlignmentCenter
    # enable user interaction so it detects tap events
    @hello_world_label.userInteractionEnabled = 'YES'
    view.addSubview(@hello_world_label)

    @pan_gesture_recognizer = UIPanGestureRecognizer.alloc.initWithTarget(self, action:'handle_pan_gestures:')
    @pan_gesture_recognizer.minimumNumberOfTouches = 1
    @pan_gesture_recognizer.maximumNumberOfTouches = 1
    @hello_world_label.addGestureRecognizer(@pan_gesture_recognizer)

  end

  def viewDidUnload
    @hello_world_label = nil
    @pan_gesture_recognizer = nil
  end

  def handle_pan_gestures(sender)
    if(sender.state != UIGestureRecognizerStateChanged && 
       sender.state != UIGestureRecognizerStateFailed)
      location = sender.locationInView(sender.view.superview)
      sender.view.center = location
    end
  end
end
