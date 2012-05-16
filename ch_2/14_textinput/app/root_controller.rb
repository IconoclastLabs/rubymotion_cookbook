class RootController < UIViewController
  def viewDidLoad
    view.backgroundColor = UIColor.whiteColor
    @label = UILabel.new
    @label.text = 'Static Text!'
    @label.font = UIFont.boldSystemFontOfSize(14)
    @label.frame = [[50,50],[250,50]]
    @label.numberOfLines = 3
    @label.adjustsFontSizeToFitWidth = 'YES'
    @label.center = view.center
    view.addSubview(@label)

    @text_field = UITextField.alloc.initWithFrame([[0,0],[200,31]])
    @text_field.borderStyle = UITextBorderStyleRoundedRect
    @text_field.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter
    @text_field.textAlignment = UITextAlignmentCenter
    @text_field.text = "The Brave Sir Robin"
    @text_field.center = view.center
    view.addSubview(@text_field)
  end
end
