class Game < NSManagedObject
  @sortKeys = ['timestamp']
  @sectionKey = 'year'
  @searchKey = 'name'

  @attributes = [
    {:name => 'name', :type => NSStringAttributeType, :default => '', :optional => false, :transient => false, :indexed => false},
    {:name => 'timestamp', :type => NSDateAttributeType, :default => nil, :optional => false, :transient => false, :indexed => false},
    {:name => 'year', :type => NSInteger16AttributeType, :default => 0, :optional => false, :transient => false, :indexed => false},
  ]

  @relationships = [
    {:name => 'players', :destination => 'Player', :inverse => 'game', :json => 'players', :optional => true, :transient => false, :indexed => false, :ordered => true, :min => 0, :max => NSIntegerMax, :del => NSCascadeDeleteRule},
  ]
  
  def addPlayersObject(value)
    # override default core-data generated accessor, faulty in iOS5.1
    # see http://stackoverflow.com/questions/7385439/problems-with-nsorderedset
    tempSet = NSMutableOrderedSet.orderedSetWithOrderedSet(self.players)
    tempSet.addObject(value)
    self.players = tempSet
  end  
end
