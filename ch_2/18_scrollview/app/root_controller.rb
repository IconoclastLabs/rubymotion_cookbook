class RootController < UIViewController
  def viewDidLoad
    super

    view.backgroundColor = UIColor.whiteColor

    macBookAir = UIImage.imageNamed("MacBookAir.png")
    @my_image_view = UIImageView.alloc.initWithImage(macBookAir)
    @my_scroll_view = UIScrollView.alloc.initWithFrame(self.view.bounds)
    @my_scroll_view.addSubview(@my_image_view)
    # White scrollbars option
    #@my_scroll_view.indicatorStyle = UIScrollViewIndicatorStyleWhite
    @my_scroll_view.contentSize = @my_image_view.bounds.size
    @my_scroll_view.delegate = self

    view.addSubview(@my_scroll_view)
  end

  def scrollViewDidScroll(scrollView)
    @my_scroll_view.alpha = 0.5
  end

  def scrollViewDidEndDecelerating(scrollView)
    @my_scroll_view.alpha = 1.0
  end

  def scrollViewDidEndDragging(scrollView)
    @my_scroll_view.alpha = 1.0
  end
end
