class RootController < UIViewController
  def viewDidLoad
    view.backgroundColor = UIColor.whiteColor

    @taps_gesture_recognizer = UITapGestureRecognizer.alloc.initWithTarget(self, action:'handle_taps:')
    @taps_gesture_recognizer.numberOfTouchesRequired = 2
    @taps_gesture_recognizer.numberOfTapsRequired = 3

    view.addGestureRecognizer(@taps_gesture_recognizer)


  end

  def viewDidUnload
    @taps_gesture_recognizer = nil
  end


  def handle_taps(sender)
    p "Handling taps"
    touch_counter = 0
    until touch_counter == sender.numberOfTouchesRequired
      touch_point = sender.locationOfTouch(touch_counter, inView:sender.view)
      touch_counter = touch_counter + 1
      p "Touch: #{touch_counter}"
    end
  end

end

