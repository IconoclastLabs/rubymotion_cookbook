class RootController < UIViewController
  def viewDidLoad
    view.backgroundColor = UIColor.grayColor

    # Regular button
    @my_button = UIButton.buttonWithType(UIButtonTypeRoundedRect)
    @my_button.frame = [[110,150],[100,37]]
    @my_button.layer.cornerRadius = 10
    @my_button.setTitleColor(UIColor.blackColor, forState:UIControlStateNormal)
    @my_button.backgroundColor = UIColor.whiteColor
    @my_button.setTitle("Press Me", forState:UIControlStateNormal)
    @my_button.setTitle("Impressive!", forState:UIControlStateHighlighted)
    # events
    @my_button.addTarget(self, action:'buttonIsPressed', forControlEvents:UIControlEventTouchDown)
    @my_button.addTarget(self, action:'buttonIsTapped', forControlEvents:UIControlEventTouchUpInside)
    view.addSubview(@my_button)

    # Button with an image background
    normalImage = UIImage.imageNamed("NormalBlueButton.png")
    highlightedImage = UIImage.imageNamed("HightlightedBlueButton.png")
    @my_image_button = UIButton.buttonWithType(UIButtonTypeCustom)
    @my_image_button.frame = [[110,250],[100,37]]
    @my_image_button.setBackgroundImage(normalImage, forState:UIControlStateNormal)
    @my_image_button.setBackgroundImage(highlightedImage, forState:UIControlStateHighlighted)
    @my_image_button.setTitle("Press Me", forState:UIControlStateNormal)
    @my_image_button.setTitle("Impressive!", forState:UIControlStateHighlighted)
    # events
    @my_image_button.addTarget(self, action:'buttonIsPressed', forControlEvents:UIControlEventTouchDown)
    @my_image_button.addTarget(self, action:'buttonIsTapped', forControlEvents:UIControlEventTouchUpInside)
    view.addSubview(@my_image_button)
  end

  def buttonIsPressed
    NSLog("Button was pressed down")
  end

  def buttonIsTapped
    NSLog("Button was tapped")
  end
end
