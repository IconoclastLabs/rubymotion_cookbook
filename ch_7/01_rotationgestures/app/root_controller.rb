class RootController < UIViewController

  def viewDidLoad
    view.backgroundColor = UIColor.whiteColor
    @swipe_gesture_recognizer = UISwipeGestureRecognizer.alloc.initWithTarget(self, action:"handle_swipe:")
    # detect swipes that go left to right
    @swipe_gesture_recognizer.direction = UISwipeGestureRecognizerDirectionLeft
    # require one finger
    @swipe_gesture_recognizer.numberOfTouchesRequired = 1

    view.addGestureRecognizer(@swipe_gesture_recognizer)
  end

  def viewDidUnload
    @swipe_gesture_recognizer = nil
  end

  def handle_swipe(sender)
    p "swipe handler called"
    if(sender.direction && UISwipeGestureRecognizerDirectionDown)
      p "Swiped down"
    end

    if(sender.direction && UISwipeGestureRecognizerDirectionLeft)
      p "Swiped left"
    end

    if(sender.direction && UISwipeGestureRecognizerDirectionRight)
      p "Swiped right"
    end

    if(sender.direction && UISwipeGestureRecognizerDirectionUp)
      p "Swiped up"
    end
  end
end
