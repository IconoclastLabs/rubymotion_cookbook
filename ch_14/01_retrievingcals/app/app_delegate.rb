class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.rootViewController = RootController.alloc.init
   
    event_store = EKEventStore.alloc.init
    # These are all the calendar types iOS can have,
    # "type" is EKCalendarType of an EKCalendar 
    calendar_types = ["Local",
                      "CalDAV",
                      "Exchange",
                      "Subscription",
                      "Birthday",
                      nil]
    calendar_types.each_with_index do |type, index|
      p "#{type}, #{index}"
    end

    event_store.calendars.each_with_index do |calendar, index|
      p "#{calendar}, #{index}, Title:  #{calendar.title}"
      p "Calendar type: #{calendar_types[calendar.type]}"
      p "Calendar color: #{UIColor.alloc.initWithCGColor(calendar.CGColor)}"
      p "Calendar can be modified: #{calendar.allowsContentModifications}"


    end

    @window.makeKeyAndVisible
    true
  end
end
