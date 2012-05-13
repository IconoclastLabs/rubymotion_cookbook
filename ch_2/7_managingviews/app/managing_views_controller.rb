class ManagingViewsController < UIViewController
  def viewDidLoad
    @label = self.view.viewWithTag(1)
    @label.text = 'Controller Output'
  end
end

