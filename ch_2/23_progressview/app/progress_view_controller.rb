class ProgressViewController < UIViewController
  def viewDidLoad
    view.backgroundColor = UIColor.whiteColor
    @progress_view = UIProgressView.alloc.initWithProgressViewStyle(UIProgressViewStyleBar)
    @progress_view.center = view.center
    @progress_view.progress = 0.5
    view.addSubview(@progress_view)
  end

  def viewDidUnload
    @progress_view = nil
  end
end
