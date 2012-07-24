class GraphicsController < UIView
  def initWithFrame(frame)
    super

    self.backgroundColor = UIColor.lightGrayColor
    self
  end

  def drawRect(rect)

    path = CGPathCreateMutable()

    rectangle1 = CGRectMake(10, 10, 200, 300)

    CGPathAddRect(path, nil, rectangle1)

    currentContext = UIGraphicsGetCurrentContext()
    
    CGContextSaveGState(currentContext)

    CGContextTranslateCTM(currentContext, 100, 0)

    CGContextAddPath(currentContext, path)

    UIColor.colorWithRed(0.2, green:0.6, blue:0.8, alpha:1).setFill

    UIColor.blackColor.setStroke

    CGContextSetLineWidth(currentContext, 5)

    CGContextDrawPath(currentContext, KCGPathFillStroke)

    #release path object is not necessary and will actually cause a crash!  as of this writing.
    #retain, release and autorelease messages are not necessary in rubymotion
    # http://www.rubymotion.com/developer-center/guides/runtime/
    #
    #CGPathRelease(path)

    CGContextRestoreGState(currentContext)

  end


end
