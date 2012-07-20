class Player < NSManagedObject
  @sortKeys = ['name']
  @sectionKey = nil
  @searchKey = 'name'

  @attributes = [
    {:name => 'name', :type => NSStringAttributeType, :default => ''},
    {:name => 'single', :type => NSBooleanAttributeType, :optional => true},
    {:name => 'note', :type => NSStringAttributeType, :optional => true}
  ]

  @relationships = [
    {:name => 'game', :destination => 'Game', :inverse => 'players'},
  ]
  
  @sections = [
    [nil, ['Name', 'name', :text, 'Single', 'single', :tick,]],
    ['Note', ['Note', 'note', :longtext]]
  ]
end
