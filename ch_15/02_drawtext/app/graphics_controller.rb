class GraphicsController < UIView
  def initWithFrame(frame)
    super

    self.backgroundColor = UIColor.lightGrayColor
    self
  end

  def drawRect(rect)
    helvetica_bold = UIFont.fontWithName("HelveticaNeue-Bold", size:36.0)

    "Iconoclast Labs".drawAtPoint([20, 180], withFont:helvetica_bold)
  end
end
