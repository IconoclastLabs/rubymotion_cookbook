class GraphicsController < UIView
  def initWithFrame(frame)
    super

    self.backgroundColor = UIColor.lightGrayColor
    self
  end

  def drawRect(rect)

    drawRooftopAtTopPointof(CGPointMake(160, 40), textToDisplay:"Miter", lineJoin:KCGLineJoinMiter)
    drawRooftopAtTopPointof(CGPointMake(160, 180), textToDisplay:"Bevel", lineJoin:KCGLineJoinBevel)
    drawRooftopAtTopPointof(CGPointMake(160, 320), textToDisplay:"Round", lineJoin:KCGLineJoinRound)
  end

  def drawRooftopAtTopPointof(paramTopPoint, textToDisplay:paramText, lineJoin:paramLineJoin)
    UIColor.brownColor.set

    currentContext = UIGraphicsGetCurrentContext()

    CGContextSetLineJoin(currentContext, paramLineJoin)

    #not in book but good to know
    CGContextSetLineCap(currentContext, KCGLineCapRound)

    CGContextSetLineWidth(currentContext, 20)
    #start point
    CGContextMoveToPoint(currentContext, paramTopPoint.x - 140, paramTopPoint.y + 100)
    #move to 
    CGContextAddLineToPoint(currentContext, paramTopPoint.x, paramTopPoint.y)
    #finish rooftop
    CGContextAddLineToPoint(currentContext, paramTopPoint.x + 140, paramTopPoint.y + 100)

    CGContextStrokePath(currentContext)

    UIColor.blackColor.set
    drawingPoint = [paramTopPoint.x + 40, paramTopPoint.y + 60]

    paramText.drawAtPoint(drawingPoint, withFont:UIFont.boldSystemFontOfSize(30))

  end

end
