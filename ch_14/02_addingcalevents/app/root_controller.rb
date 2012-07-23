class RootController < UIViewController
  def viewDidLoad
  end

  def viewDidUnload
  end

  def create_event(title="New Event", start_date, end_date, calendar_title, calendar_type, notes = nil)
    result = false
    event_store = EKEventStore.new
    if(event_store.calendars.count == 0)
      p "No calendars found"
    end

    target_cal = nil
    event_store.calendars.each do |cal|
        if(cal.title.isEqualToString(calendar_title)
          && cal.type == calendar_type)
          target_cal = cal
        end
    end
    if(target_cal.nil?)
      p "Could not find requested calendar"
      result = false
    end
    if(target_cal.allowsContentModifications == false)
      p "Selected calendar does not allow modiciations"
      result = false
    end

    event = EKEvent.EKEvent.eventWithEventStore(event_store)
    event.calendar = target_cal
    event.title = title
    event.notes = notes
    event.startDate = start_date
    event.endDate = end_date
    error_ptr = Pointer.new(:object)
    error = error_ptr[0]

    result
  end
end