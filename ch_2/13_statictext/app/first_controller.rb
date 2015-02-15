class FirstController < UIViewController
  def viewDidLoad
    view.backgroundColor = UIColor.whiteColor
    @label = UILabel.new
    @label.text = 'Static Text! asdfsjkasdfjklsd;flhasd;fas;dlkfas;ldfjkalsdkfuhsadfuhasdlfnasdlkfhlasdflopifq9023487174i'
    @label.font = UIFont.boldSystemFontOfSize(32)
    @label.frame = [[500,500],[300,500]]
    @label.numberOfLines = 5
    @label.adjustsFontSizeToFitWidth = true
    @label.center = view.center
    view.addSubview(@label)
  end
end
