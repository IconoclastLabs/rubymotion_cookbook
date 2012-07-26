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
    @xcode_image_view1.transform = CGAffineTransformIdentity

    UIView.beginAnimations(nil, context:nil)
    UIView.setAnimationDuration(5)

    @xcode_image_view1.transform = CGAffineTransformMakeScale(2, 2)

    UIView.commitAnimations
  end

end
