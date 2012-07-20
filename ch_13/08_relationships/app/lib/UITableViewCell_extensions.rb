class UITableViewCell 
  def title
    textLabel.text
  end
  
  def title=(aString)
    textLabel.text = aString
  end
  
  def subtitle=(aString)
    detailTextLabel.text = aString
  end

  def tick(aBoolean)
    self.accessoryType = if aBoolean == false || aBoolean == 0 then
      UITableViewCellAccessoryNone
    else
      UITableViewCellAccessoryCheckmark
   end
  end
  
  def disclose(aBoolean)
     self.accessoryType = if aBoolean == false || aBoolean == 0 then
       UITableViewCellAccessoryNone
     else
       UITableViewCellAccessoryDisclosureIndicator
    end
  end
  
  def clear
  end
end