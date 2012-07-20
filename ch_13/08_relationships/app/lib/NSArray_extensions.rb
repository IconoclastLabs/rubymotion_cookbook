class NSArray
  def to_ip
    NSIndexPath.indexPathForRow(self[1], inSection:self[0])
  end
  
  def mean
    return 0 unless size > 0
    
    reduce(:+).to_f / size
  end
end