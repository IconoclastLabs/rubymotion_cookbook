class GraphicsController < UIView
  def initWithFrame(frame)
    super

    self.backgroundColor = UIColor.lightGrayColor
    self
  end

  def drawRect(rect)

    # 15.04
    image = UIImage.imageNamed("ilabs.png")

    if image.nil?
      p "Failed to load the image"
    else
      p "Successfully loaded the image"
    end

    # draw image
    image.drawAtPoint([0, 20])

    # draw via rect
    image.drawInRect([[50,10],[40,35]])

    ilblue = UIColor.colorWithRed(0.47, green:0.7, blue:0.7, alpha:0.9)
    black = UIColor.blackColor
    black.set
    helvetica_bold = UIFont.fontWithName("HelveticaNeue-Bold", size:36.0)

    "Iconoclast Labs".drawInRect([[51, 101], [200,200]], withFont:helvetica_bold)
    
    ilblue.set
    "Iconoclast Labs".drawInRect([[50, 100], [200,200]], withFont:helvetica_bold)

    analize_color(ilblue)
  end

  def analize_color(color)
    colorRef = color.CGColor
    components = CGColorGetComponents(colorRef)

    total_components = CGColorGetNumberOfComponents(colorRef) - 1

    for i in 0..total_components
      p "Component #{i} = #{components[i]}"
    end

  end
end
