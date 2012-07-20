class GraphicsController < UIView
  def initWithFrame(frame)
    super

    self.backgroundColor = UIColor.lightGrayColor
    self
  end

  def drawRect(rect)

    path = CGPathCreateMutable()

    screenBounds = UIScreen.mainScreen.bounds

    CGPathMoveToPoint(path, nil, screenBounds.origin.x, screenBounds.origin.y)

    CGPathAddLineToPoint(path, nil, screenBounds.size.width, screenBounds.size.height)

    CGPathMoveToPoint(path, nil, screenBounds.size.width, screenBounds.origin.y)

    CGPathAddLineToPoint(path, nil, screenBounds.origin.x, screenBounds.size.height)

    currentContext = UIGraphicsGetCurrentContext()

    #add path to context - Doesn't draw it
    CGContextAddPath(currentContext, path)

    UIColor.blueColor.setStroke

    #Use stroke to draw the path
    CGContextDrawPath(currentContext, KCGPathStroke)

    #release path object is not necessary and will actually cause a crash!  as of this writing.
    #retain, release and autorelease messages are not necessary in rubymotion
    # http://www.rubymotion.com/developer-center/guides/runtime/
    #
    #CGPathRelease(path)

  end


end
