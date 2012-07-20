class NSIndexPath
  def self.indexPathForRows(range, inSection:section)
    rows = []
    range.each {|i|
      rows << indexPathForRow(i, inSection:section)
    }
    rows
  end
  
  def to_a
    [section, row]
  end
end