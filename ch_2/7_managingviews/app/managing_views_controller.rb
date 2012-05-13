class ManagingViewsController < UIViewController
  def viewDidLoad
    @label = self.view.subviews.first
    @label.text = 'Controller Output'
  end
end

