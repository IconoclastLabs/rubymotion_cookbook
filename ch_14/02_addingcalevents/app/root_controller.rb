class RootController < UIViewController
  def viewDidLoad
    view.backgroundColor = UIColor.whiteColor
    event = self.create_event("Groundhog Day", startDate: Time.dateWithNaturalLanguageString("February 2nd"), endDate: Time.dateWithNaturalLanguageString("February 3rd"), calendarTitle: "Calendar", calendarType: EKCalendarTypeLocal, eventNotes: "Starring: Bill Murray")
    if(event)
      p "Success"
    else
      p "Fail"
    end
  end

  def viewDidUnload
  end

  def create_event(title, startDate: start_date, endDate: end_date, calendarTitle: calendar_title, calendarType: calendar_type, eventNotes: notes)
    result = false
    event_store = EKEventStore.new
    if(event_store.calendars.count == 0)
      p "No calendars found"
    end

    target_cal = nil
    event_store.calendars.each do |cal|
        if((cal.title == calendar_title) && (cal.type == calendar_type))
          target_cal = cal
          break
        end
    end
    if(target_cal.nil?)
      p "Could not find requested calendar"
      result = false
    end
    if(!target_cal.nil?)
      if(target_cal.allowsContentModifications == false)
        p "Selected calendar does not allow modiciations"
        result = false
      end
    end
    event = EKEvent.eventWithEventStore(event_store)
    event.calendar = target_cal
    event.title = title
    event.notes = notes
    event.startDate = start_date
    event.endDate = end_date
    error_ptr = Pointer.new(:object)
    result = event_store.saveEvent(event, span: EKSpanThisEvent, error:error_ptr)
    if(result == false)
      error = error_ptr[0]
      p "An error occured: #{error}"
    else
      p "#{event.title}: #{event.notes} added to calendar #{event.calendar.type}"
      p "#{event.startDate} to #{event.endDate}"
    end

    result
  end
end