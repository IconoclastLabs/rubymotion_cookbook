class FirstController < UIViewController
  def viewDidLoad
    view.backgroundColor = UIColor.whiteColor
    @label = UILabel.new
    @label.text = 'Static Text! asdfsjkasdfjklsd;flhasd;fas;dlkfas;ldfjkalsdkfuhsadfuhasdlfnasdlkfhlasdflsadfjkjdfsjjjpoqwiero,mnzxcv,mnvnoibagfopifq9023487174i'
    @label.font = UIFont.boldSystemFontOfSize(14)
    @label.frame = [[50,50],[250,50]]
    @label.numberOfLines = 3
    @label.adjustsFontSizeToFitWidth = true
    @label.center = view.center
    view.addSubview(@label)
  end
end
