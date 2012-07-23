class GraphicsController < UIView
  def initWithFrame(frame)
    super

    self.backgroundColor = UIColor.lightGrayColor
    self
  end

  def drawRect(rect)

    currentContext = UIGraphicsGetCurrentContext()

    # store state it is in now
    CGContextSaveGState(currentContext)

    color_space = CGColorSpaceCreateDeviceRGB()

    start_color = UIColor.orangeColor
    start_color_components = CGColorGetComponents(start_color.CGColor)

    end_color = UIColor.blueColor
    end_color_components = CGColorGetComponents(end_color.CGColor)
    
    color_components = Pointer.new(:float, 8)
    color_components[0] = start_color_components[0]
    color_components[1] = start_color_components[1]
    color_components[2] = start_color_components[2]
    color_components[3] = start_color_components[3]

    color_components[4] = end_color_components[0]
    color_components[5] = end_color_components[1]
    color_components[6] = end_color_components[2]
    color_components[7] = end_color_components[3]

    color_indicies = Pointer.new(:float, 2)
    color_indicies[0] = 0
    color_indicies[1] = 1

    gradient = CGGradientCreateWithColorComponents(color_space, color_components, color_indicies, 2) 

    start_point = CGPointMake(120, 260)
    end_point = CGPointMake(200, 220)

    # Draws gradient over entire screen
    CGContextDrawLinearGradient(currentContext, gradient, start_point, end_point, KCGGradientDrawsBeforeStartLocation |  KCGGradientDrawsAfterEndLocation)
    # Draws diagonal gradient like in figure 15-28
    #CGContextDrawLinearGradient(currentContext, gradient, start_point, end_point, 0)

    CGContextRestoreGState(currentContext)

  end


end
