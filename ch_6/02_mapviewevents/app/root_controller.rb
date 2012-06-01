class RootController < UIViewController
  def didReceiveMemoryWarning
    super
  end

  def viewDidLoad
    view.backgroundColor = UIColor.lightGrayColor
    
    @my_map_view = MKMapView.alloc.initWithFrame(view.bounds)
    # Changed this for variety
    @my_map_view.mapType = MKMapTypeStandard
    @my_map_view.delegate = self

    @my_map_view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight

    view.addSubview(@my_map_view)
  end

  def viewDidUnload
    @my_map_view = nil
  end

  def shouldAutorotateToInterfaceOrientation(interfaceOrientation)
    true
  end

  #delegate code
  def mapViewWillStartLoadingMap(mapView)
    p "Map View Will Start Loading Map Event"
  end

end
