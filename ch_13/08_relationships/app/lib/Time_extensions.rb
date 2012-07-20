class Time
  def year
    NSCalendar.currentCalendar.components(NSYearCalendarUnit, fromDate:self).year
  end
  
  def days_to(other)
    NSCalendar.currentCalendar.components(NSDayCalendarUnit, fromDate:self, toDate:other, options:0).day
  end

  def days_add(days)
    components = NSDateComponents.alloc.init
    components.day = days
    NSCalendar.currentCalendar.dateByAddingComponents(components, toDate:self, options:0)
  end
end