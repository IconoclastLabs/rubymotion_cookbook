class RootController < UIViewController
  def didReceiveMemoryWarning
    super
  end

  def locationManager(manager, didUpdateToLocation:newLocation, fromLocation:oldLocation)
    # got a new location
    p "Latitude = #{newLocation.coordinate.latitude}"
    p "Longitude = #{newLocation.coordinate.longitude}"
  end

  def locationManager(manager, didFailWithError:error)
    p "Failed"
  end

  def viewDidLoad
    view.backgroundColor = UIColor.lightGrayColor
    

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
