class RootController < UIViewController
  def didReceiveMemoryWarning
    super
  end

  def locationManager(manager, didUpdateToLocation:newLocation, fromLocation:oldLocation)
    # got a new location
    @label.text = "Latitude = #{newLocation.coordinate.latitude} Longitude = #{newLocation.coordinate.longitude}"
    p @label.text
  end

  def locationManager(manager, didFailWithError:error)
    p "Failed"
  end

  def viewDidLoad
    view.backgroundColor = UIColor.lightGrayColor
    @label = UILabel.new
    @label.text = 'Gyro'
    @label.frame = [[0,50],[UIScreen.mainScreen.bounds.size.width,150]]
    @label.numberOfLines = 0
    view.addSubview(@label)
    

    if (CLLocationManager.locationServicesEnabled)
      @my_location_manager = CLLocationManager.alloc.init
      @my_location_manager.delegate = self

      @my_location_manager.purpose = "To provide functionality based on user's current location" 
      @my_location_manager.startUpdatingLocation
    else
      p "Location services are not enabled... so go do that... yeah"
    end

  end

  def viewDidUnload
    @my_location_manager.stopUpdatingLocation
    @my_location_manager = nil
  end

  def shouldAutorotateToInterfaceOrientation(interfaceOrientation)
    true
  end

end
