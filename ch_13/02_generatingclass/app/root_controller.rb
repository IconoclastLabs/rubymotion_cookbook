class RootController < UIViewController
  def viewDidLoad
    view.backgroundColor = UIColor.lightGrayColor
  
    self.title = "Core Data"

    @label = UILabel.new
    @label.text = 'No Errors'
    @label.frame = [[0,50],[UIScreen.mainScreen.bounds.size.width,50]]
    view.addSubview(@label)

  end

end
