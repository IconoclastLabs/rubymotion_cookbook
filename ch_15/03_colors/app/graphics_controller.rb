class GraphicsController < UIView
  def initWithFrame(frame)
    super

    self.backgroundColor = UIColor.lightGrayColor
    self
  end

  def drawRect(rect)

    magenta = UIColor.colorWithRed(0.5, green:0, blue:0.5, alpha:1)

    magenta.set
    helvetica_bold = UIFont.fontWithName("HelveticaNeue-Bold", size:36.0)

    #"Iconoclast Labs".drawAtPoint([20, 180], withFont:helvetica_bold)
    "Iconoclast Labs".drawInRect([[50, 100], [200,200]], withFont:helvetica_bold)

    analize_color(magenta)
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
