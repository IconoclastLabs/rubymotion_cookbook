class GraphicsController < UIView
  def initWithFrame(frame)
    super

    self.backgroundColor = UIColor.lightGrayColor
    self
  end

  def drawRect(rect)

    path = CGPathCreateMutable()

    rectangle1 = CGRectMake(10, 10, 200, 300)

    rectangle2 = CGRectMake(40, 100, 90, 300)

    # Handling the madness of making an array of pointers
    # VERY Procedural, you'll want to clean this up in any ACTUAL practice
    rects_ptr = Pointer.new(CGRect.type, 2) 
    rects_ptr[0] = rectangle1
    rects_ptr[1] = rectangle2

    CGPathAddRects(path, nil, rects_ptr, 2)

    currentContext = UIGraphicsGetCurrentContext()

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

  end


end
