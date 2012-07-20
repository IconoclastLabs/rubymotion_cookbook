class NSManagedObject
  def to_cells(delegate)
    cells = {}
    tag = 1
    managedObjectClass.sections.each.map do |label, rows|
      rows.each_slice(3).map do |title, property, type|
        cells[property] = newCellWithTitle(title, property:property, type:type, tag:tag, delegate:delegate)
        tag += 1 if type == :text or type == :longtext
      end
    end
    cells
  end
  
  def from_cells(cells)
    cells.each do |property, cell|
      if cell.kind_of?(UITableViewTextFieldCell) then
        setValue(cell.value, forKey:property)
      else
      end 
    end
  end
  
  CellID = 'CellIdentifier'
  def newCellWithTitle(title, property:property, type:type, tag:tag, delegate:delegate)
    case type
    when :text then
      UITableViewTextFieldCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier:CellID).tap do |c|
        c.textLabel.text = title
        c.textField.tap do |tf|
          tf.text = valueForKey(property)
          tf.placeholder = property
          tf.returnKeyType = UIReturnKeyNext
          tf.tag = tag
          tf.delegate = delegate
        end
        c
      end
      
    when :longtext then
      UITableViewTextViewCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier:CellID).tap do |c|
        c.textView.tap do |tv|
          tv.text = valueForKey(property)
          tv.tag = tag
          tv.delegate = delegate
        end
        c
      end
      
    when :tick then
      UITableViewCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier:CellID).tap do |c|
        c.textLabel.text = title
      end
    end
  end
end