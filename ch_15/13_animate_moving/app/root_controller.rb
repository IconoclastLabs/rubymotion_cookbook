class RootController < UIViewController

  def viewDidLoad
    super
    xcode_image = UIImage.imageNamed("ilabs.png")

    @xcode_image_view1 = UIImageView.alloc.initWithImage(xcode_image)
    @xcode_image_view2 = UIImageView.alloc.initWithImage(xcode_image)

    @xcode_image_view1.setFrame(CGRectMake(0,0,100,100))
    @xcode_image_view2.setFrame(CGRectMake(220, 350, 100, 100))

    view.backgroundColor = UIColor.whiteColor
    view.addSubview(@xcode_image_view1)
    view.addSubview(@xcode_image_view2)

  end

  def viewDidAppear paramAnimated
    super

    startTopLeftImageViewAnimation
    startBottomRightViewAnimationAfterDelay(2)
  end

  def startTopLeftImageViewAnimation

    @xcode_image_view1.setFrame([[0,0],[100,100]])
    @xcode_image_view1.setAlpha(1)

    UIView.beginAnimations("xcodeImageView1Animation", context:nil)

    UIView.setAnimationDuration(3)

    UIView.setAnimationDelegate(self)

    UIView.setAnimationDidStopSelector('imageViewDidStop:finished:context:')

    @xcode_image_view1.setFrame([[200,350],[100,100]])

    @xcode_image_view1.setAlpha(0)
    UIView.commitAnimations
  end

  def startBottomRightViewAnimationAfterDelay paramDelay
    @xcode_image_view2.setFrame([[220,350],[100,100]])
    @xcode_image_view2.setAlpha(1)

    UIView.beginAnimations("xcodeImageView2Animation", context:nil)

    UIView.setAnimationDuration(3)

    UIView.setAnimationDelay(paramDelay)

    UIView.setAnimationDelegate(self)

    UIView.setAnimationDidStopSelector('imageViewDidStop:finished:context:')

    @xcode_image_view2.setFrame([[0,0],[100,100]])

    @xcode_image_view2.setAlpha(0)
    UIView.commitAnimations
  end

  def imageViewDidStop(paramAnimationID, finished:paramFinished, context:paramContext)
    p "Animation Finished"
  end
end
