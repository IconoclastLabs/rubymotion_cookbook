class UIView
  def firstResponder
    return self if isFirstResponder
    subviews.each {|s| v = s.firstResponder; return v if v}
    nil
  end
end