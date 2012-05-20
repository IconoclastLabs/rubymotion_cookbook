class RootController < UIViewController
  def viewDidLoad
      super
      view.backgroundColor = UIColor.whiteColor

      @my_text_view = UITextView.alloc.initWithFrame(self.view.bounds)
      @my_text_view.text = "Some text"
      @my_text_view.font = UIFont.systemFontOfSize(16)
      view.addSubview(@my_text_view)
  end

end
