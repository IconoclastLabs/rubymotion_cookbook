class SecondaryController < UIViewController
  def viewDidLoad
    @label = UILabel.new
    @label.text = 'SecondaryController'
    @label.frame = [[50,50],[250,50]]
    view.addSubview(@label)
  end
end

