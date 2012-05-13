class ManagingViewsController < UIViewController
  def viewDidLoad
    @label = self.view.select('mylabel')
    @label.text = 'Controller Output'
  end
end

