class MyAnnotation

  #pin constants from the header file
  REUSABLE_PIN_RED = "Red"
  REUSABLE_PIN_GREEN = "Green"
  REUSABLE_PIN_PURPLE = "Purple"

  # this portion needs to be settable
  attr_accessor :pinColor

  # these need to be implemented this way as part of MKAnnotation
  def coordinate; @coordinate; end
  def title; @title; end
  def subtitle; @subtitle; end

  # use this as a class method
  def self.reusableIdentifierforPinColor(paramColor)
    result = case paramColor
      when MKPinAnnotationColorRed
        REUSABLE_PIN_RED
      when MKPinAnnotationColorGreen
        REUSABLE_PIN_GREEN
      when MKPinAnnotationColorPurple
        REUSABLE_PIN_PURPLE
    end

    result
  end

  def initWithCoordinates(paramCoordinates, title:paramTitle, subTitle:paramSubTitle)
    @coordinate = paramCoordinates
    @title = paramTitle
    @subtitle = paramSubTitle
    @pinColor = MKPinAnnotationColorGreen

    self
  end



end
