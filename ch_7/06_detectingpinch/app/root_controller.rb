class RootController < UIViewController
  def viewDidLoad
    view.backgroundColor = UIColor.whiteColor

    label_rect = CGRectMake(0,0,200,200)
    @black_label = UILabel.alloc.initWithFrame(label_rect)
    @black_label.center = view.center
    @black_label.backgroundColor = UIColor.blackColor
    
    @black_label.userInteractionEnabled = 'YES'

    view.addSubview(@black_label)

    @pinchGestureRecognizer = UIPinchGestureRecognizer.alloc.initWithTarget(self, action:'handle_pinches:')
    @black_label.addGestureRecognizer(@pinchGestureRecognizer)

  end

  def viewDidUnload
    @black_label = nil
    @pinchGestureRecognizer
  end

  def handle_pinches(sender)
    current_scale = 0
    
    if(sender.state == UIGestureRecognizerStateEnded)
      current_scale = sender.scale
    elsif(sender.state == UIGestureRecognizerStateBegan && current_scale != 0)
      sender.scale = current_scale
    end

    if(!sender.scale.to_f.nan? && sender.scale != 0)
      sender.view.transform =  CGAffineTransformMakeScale(sender.scale, sender.scale)
    end
  end


end
