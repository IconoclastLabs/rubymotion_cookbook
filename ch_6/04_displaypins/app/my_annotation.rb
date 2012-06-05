class MyAnnotation

  # Don't do it this way!  Can't use these to extend Objective-C!
  #attr_reader :coordinate, :title, :subtitle

  #intead use this madness!
  def coordinate; @coordinate; end
  def title; @title; end
  def subtitle; @subtitle; end

  def initWithCoordinates(paramCoordinates, title:paramTitle, subTitle:paramSubTitle)
    @coordinate = paramCoordinates
    @title = paramTitle
    @subtitle = paramSubTitle

    self
  end



end
