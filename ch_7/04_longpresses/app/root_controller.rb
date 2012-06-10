class RootController < UIViewController
  def viewDidLoad
    view.backgroundColor = UIColor.whiteColor

    @dummy_button = UIButton.buttonWithType(UIButtonTypeRoundedRect)
    @dummy_button.frame = CGRectMake(0,0,72,37)
    @dummy_button.center = view.center
    view.addSubview(@dummy_button)

    @long_press_gesture_recognizer = UILongPressGestureRecognizer.alloc.initWithTarget(self, action:"handle_press_gestures:")
    @long_press_gesture_recognizer.numberOfTouchesRequired = 2
    @long_press_gesture_recognizer.allowableMovement = 100
    @long_press_gesture_recognizer.minimumPressDuration = 1
    view.addGestureRecognizer(@long_press_gesture_recognizer)

  end

  def viewDidUnload
    @dummy_button = nil
    @long_press_gesture_recognizer = nil
  end

  def handle_press_gestures(sender)
    if(sender == @long_press_gesture_recognizer)
      if(sender.numberOfTouchesRequired == 2)
        touch_point_1 = sender.locationOfTouch(0,inView: sender.view)
        touch_point_2 = sender.locationOfTouch(1,inView: sender.view)
        midpointX = (touch_point_1.x + touch_point_2.x)/2
        midpointY = (touch_point_1.y + touch_point_2.y)/2
        midpoint = CGPointMake(midpointX, midpointY)

        @dummy_button.center = midpoint
      else
        # Handle long presses here when the long press was not performed with 2 fingers
      end
    end
  end
end
