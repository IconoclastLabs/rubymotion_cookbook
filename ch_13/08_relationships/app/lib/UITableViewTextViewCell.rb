class UITableViewTextViewCell < UITableViewCell
  def textView
    @textView
  end
  
  def value
    @textView.text
  end
  
  def value=(newValue)
    @textView.text = newValue
  end
  
  def clear
    @textView.text = nil
  end
  
  def initWithStyle(style, reuseIdentifier:reuseIdentifier)
    if super then
      @textView = UITextView.alloc.initWithFrame(self.bounds).tap do |t|
        t.textColor = UIColor.blackColor
        t.backgroundColor = UIColor.clearColor
        t.autocorrectionType = UITextAutocorrectionTypeNo
        t.autocapitalizationType = UITextAutocapitalizationTypeNone
        t.textAlignment = UITextAlignmentLeft
        t.enabled = true
        t
      end
      addSubview(@textView)
  
      selectionStyle = UITableViewCellSelectionStyleNone
      accessoryType = UITableViewCellAccessoryNone
    end
    
    self
  end

  def layoutSubviews
    super
  end
end