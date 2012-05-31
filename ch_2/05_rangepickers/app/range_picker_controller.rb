class RangePickerController < UIViewController
  def viewDidLoad
    view.backgroundColor = UIColor.whiteColor
    @mySlider = UISlider.alloc.initWithFrame([[0.0,0.0],[200.0,23.0]])
    @mySlider.center = view.center
    @mySlider.minimumValue = 0.0
    @mySlider.maximumValue = 100.0
    @mySlider.value = @mySlider.maximumValue / 2.0
    @mySlider.continuous = false
    @mySlider.setThumbImage(UIImage.imageNamed('ThumbNormal.png'), forState:UIControlStateNormal)
    @mySlider.setThumbImage(UIImage.imageNamed('ThumbHighlighted.png'), forState:UIControlStateHighlighted)
    @mySlider.addTarget(self, action:'sliderValueChanged', forControlEvents:UIControlEventValueChanged)
    view.addSubview(@mySlider)
    
    @label = UILabel.new
    @label.text = 'Slider Value:'
    @label.frame = [[0,0],[250,150]]
    view.addSubview(@label)
  end

  def sliderValueChanged
    @label.text = "Slider Value: #{@mySlider.value}"
  end
end
