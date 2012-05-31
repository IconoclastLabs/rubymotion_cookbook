class ShakeWindow < UIWindow
  
  def motionEnded(motion, withEvent:event)
    if (motion == UIEventSubtypeMotionShake)
      p "Shake Detected"
      self.rootViewController.shake_event
    end
  end
    
end
