class RootController < UIViewController
  def viewDidLoad
    super

    view.backgroundColor = UIColor.whiteColor

    macBookAir = UIImage.imageNamed("MacBookAir.png")
    @my_image_view = UIImageView.alloc.initWithFrame(self.view.bounds)
    @my_image_view.contentMode = UIViewContentModeScaleAspectFit
    @my_image_view.image = macBookAir
    @my_image_view.center = self.view.center
    view.addSubview(@my_image_view)
  end

end
