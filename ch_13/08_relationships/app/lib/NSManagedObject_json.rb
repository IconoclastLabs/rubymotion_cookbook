class NSManagedObject
  def self.from_json_bulk(json)
    json.each do |subjson|
      #NSLog("#{name}")
      obj = NSEntityDescription.insertNewObjectForEntityForName(name, inManagedObjectContext:Store.shared.context)
      obj.from_json(subjson)
    end
    Store.shared.save
  end
    
  def from_json(json)
    if json.kind_of?(String) then
      error_ptr = Pointer.new(:object)
      unless json = NSJSONSerialization.JSONObjectWithData(json.dataUsingEncoding(NSUTF8StringEncoding), options:0, error:error_ptr)
        raise "Error when fetching data: #{error_ptr[0].description}"
      end
    end
    
    _from_json(json)
  end
  
  def to_json
    error_ptr = Pointer.new(:object)  
    unless data = NSJSONSerialization.dataWithJSONObject(_to_json, options:NSJSONWritingPrettyPrinted, error:error_ptr)
      raise "Error when fetching data: #{error_ptr[0].description}"
    end
    NSString.alloc.initWithData(data, encoding:NSUTF8StringEncoding)
  end

  
  private

  
  def _from_json(json)
    self.entity.attributesByName.each.map do |attrName, attr|
      from_json_attr(json, attr)
    end
    
    self.entity.relationshipsByName.each.map do |relName, rel|
      from_json_rel(json, rel)
    end
    
    self
  end
  
  def from_json_attr(json, attr)
    if value = json[attr.jsonKeypath] then
      if value.kind_of?(Array) then
        NSLog("attr[] #{attr.name}...")
        self.setValue(value.join.strip, forKey:attr.name)
      else
        NSLog("attr #{attr.name}...")
        value = case attr.attributeType
          when NSDateAttributeType then ISO8601DateFormatter.alloc.init.dateFromString(value)
          else value
        end
        self.setValue(value, forKey:attr.name)
      end
    end
  end
  
  def from_json_rel(json, rel)
    if value = json[rel.name] then
      if value.kind_of?(Array) then
        array = value.collect do |subjson|
          obj = NSEntityDescription.insertNewObjectForEntityForName(rel.destinationEntity.relName, inManagedObjectContext:Store.shared.context)
          obj._from_json(subjson)
          obj
        end
        NSLog("rel[] #{value}")
        self.setValue(NSOrderedSet.orderedSetWithArray(array), forKey:rel.name)
      else
        obj = NSEntityDescription.insertNewObjectForEntityForName(rel.destinationEntity.relName, inManagedObjectContext:Store.shared.context)
        obj._from_json(value)
        NSLog("rel #{value}")
        self.setValue(obj, forKey:rel.name)
      end
    end
  end
  
  def _to_json
    json = {}
        
    self.entity.attributesByName.collect.map do |attrName, attr|
      json[attr.jsonKeypath] = to_json_attr(attr)
    end
    
    self.entity.relationshipsByName.collect.map do |relName, rel|
      json[rel.jsonKeypath] = to_json_rel(rel)
    end
    
    json
  end

  def to_json_attr(attr)
    self.valueForKey(attr.jsonKeypath)
  end
  
  def to_json_rel(rel)
    if rel.maxCount > 1 then
      self.valueForKey(rel.jsonKeypath).to_enum.collect{|obj| obj._to_json}
    else
      self.valueForKey(rel.jsonKeypath)._to_json
    end
  end
end