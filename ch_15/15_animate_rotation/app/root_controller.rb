class RootController < UIViewController

  def viewDidLoad
    super
    xcode_image = UIImage.imageNamed("ilabs.png")

    @xcode_image_view1 = UIImageView.alloc.initWithImage(xcode_image)

    @xcode_image_view1.setFrame(CGRectMake(0,0,100,100))

    view.backgroundColor = UIColor.whiteColor
    view.addSubview(@xcode_image_view1)
  end

  def viewDidAppear paramAnimated
    super

    @xcode_image_view1.center = view.center
    UIView.beginAnimations("xcodeImageView1Animation", context:nil)

    UIView.setAnimationDuration(5)

    UIView.setAnimationDelegate(self)

    UIView.setAnimationDidStopSelector('clockwiseRotationDidStop:finished:context:')

    @xcode_image_view1.transform = CGAffineTransformMakeRotation(3.141592654 / 2)

    UIView.commitAnimations

  end

  def clockwiseRotationDidStop(paramAnimationID, finished:paramFinished, context:paramContext)
    p "Animation Finished now rotate back"

    UIView.beginAnimations("xcodeImageView1AnimationBack", context:nil)

    UIView.setAnimationDuration(5)

    @xcode_image_view1.transform = CGAffineTransformIdentity

    UIView.commitAnimations
  end
end
