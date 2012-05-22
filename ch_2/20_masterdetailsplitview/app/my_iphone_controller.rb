class MyIphoneController < UIViewController
  def viewDidLoad
    @label = UILabel.alloc.init
    @label.text = "Only iPhones see this"
    @label.frame = [[0,0],[250,150]]
    view.addSubview(@label)
  end
end
