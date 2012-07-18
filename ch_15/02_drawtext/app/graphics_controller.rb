class GraphicsController < UIView
  def initWithFrame(frame)
    super

    self
  end

  def drawRect(rect)
    p "This never runs"

    helvetica_bold = UIFont.fontWithName("HelveticaNeue-Bold", size:40.0)

    "Iconoclast Labs".drawAtPoint(CGPointMake(40, 180), withFont:helvetica_bold)
  end
end
