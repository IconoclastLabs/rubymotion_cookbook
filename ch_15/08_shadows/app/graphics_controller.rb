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

    ########### First Rect
    CGContextSetShadowWithColor(currentContext, CGSizeMake(10, 10), 20, UIColor.grayColor.CGColor)
    path = CGPathCreateMutable()
    rectangle1 = CGRectMake(55, 60, 150, 150)
    CGPathAddRect(path, nil, rectangle1)
    CGContextAddPath(currentContext, path)
    UIColor.colorWithRed(0.2, green:0.6, blue:0.8, alpha:1).setFill
    CGContextDrawPath(currentContext, KCGPathFillStroke)

    # restore state before shadow
    CGContextRestoreGState(currentContext)

    ########## Second Rect
    rectangle2 = CGRectMake(150, 250, 100, 100)
    CGPathAddRect(path, nil, rectangle2)
    CGContextAddPath(currentContext, path)
    UIColor.colorWithRed(0.2, green:0.6, blue:0.8, alpha:1).setFill
    CGContextDrawPath(currentContext, KCGPathFillStroke)


  end


end
