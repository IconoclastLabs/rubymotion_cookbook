class RootController < UIViewController
  def viewDidLoad
    super

    view.backgroundColor = UIColor.whiteColor

    macBookAir = UIImage.imageNamed("MacBookAir.png")
    iPad = UIImage.imageNamed("iPad.png")
    iPhone = UIImage.imageNamed("iPhone.png")
    scrollViewRect = view.bounds

    @my_scroll_view = UIScrollView.alloc.initWithFrame(scrollViewRect)
    @my_scroll_view.pagingEnabled = 'YES'
    @my_scroll_view.contentSize = CGSizeMake(scrollViewRect.size.width * 3.0, scrollViewRect.size.height)
    view.addSubview(@my_scroll_view)

    imageViewRect = view.bounds
    iPhoneImageView = self.newImageViewWithImage(iPhone, frame:imageViewRect)
    @my_scroll_view.addSubview(iPhoneImageView)

    #Next page by moving the x position to the next image view
    imageViewRect.origin.x += imageViewRect.size.width
    iPadImageView = self.newImageViewWithImage(iPad, frame:imageViewRect)
    @my_scroll_view.addSubview(iPadImageView)

    #Next page by moving x again
    imageViewRect.origin.x += imageViewRect.size.width
    macBookAirImageView = self.newImageViewWithImage(macBookAir, frame:imageViewRect)
    @my_scroll_view.addSubview(macBookAirImageView)
  end

  # fun fact, this function is not covered in the book
  def newImageViewWithImage(paramImage, frame:paramFrame)
    result = UIImageView.alloc.initWithFrame(paramFrame)
    result.contentMode = UIViewContentModeScaleAspectFit
    result.image = paramImage
    result
  end
end
