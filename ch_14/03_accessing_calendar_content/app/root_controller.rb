class RootController < UIViewController
  def viewDidLoad
    view.backgroundColor = UIColor.whiteColor
    @label = UILabel.new
    @label.text= "Nothing Loaded Yet"
    @label.frame = [[50,50],[250,50]]
    @label.numberOfLines = "3"
    @label.center = view.center
    view.addSubview(@label)
    read_events
  end

  def viewDidUnload
  end

  def calDAVCalendarWithTitleContaining(param)
    result = nil
    event_store = EKEventStore.new
    event_store.calendars.each do |calendar|
      #@label.text = "#{@label.text} #{calendar.title}"
      if(calendar.type == EKCalendarTypeCalDAV)
        if(calendar.title.rangeOfString(param).location != NSNotFound)
          result = calendar
          break
        end
      end
    end
    result
  end

  def read_events
    target_cal = calDAVCalendarWithTitleContaining("iconoclastlabs.com")
    if(target_cal.nil?)
      @label.text = "No CalDAV calendar was found with that title"
      return
    end
    event_store = EKEventStore.new
    p "Event Store #{event_store}"
    start_date = NSDate.date
    p "Start Date #{start_date}"
    end_date = start_date.dateByAddingTimeInterval(24*60*60)
    p "End Date #{end_date}"
    search_predicate = event_store.predicateForEventsWithStartDate(start_date, endDate: end_date, calendars: target_cal)
    p "Search Predicate #{search_predicate}"
    if(search_predicate.nil?)
      @label.text = "Could not create the search predicate"
      return
    end
    events = event_store.eventsMatchingPredicate(search_predicate)
    p "#{events}"
    if(events.nil?)
      @label.text = "The array of events for this start/end time was nil"
    else
      events.each do |event|
        @label.text = "Event #{event.title}, start date: #{event.startDate}"
        @label.text = "Event #{event.title}, end date: #{event.endDate}"
      end
    end
  end
end
