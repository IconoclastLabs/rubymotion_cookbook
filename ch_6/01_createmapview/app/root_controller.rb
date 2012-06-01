class RootController < UIViewController
  def didReceiveMemoryWarning
    super
  end

  def viewDidLoad
    view.backgroundColor = UIColor.lightGrayColor
    
    @my_map_view = MKMapView.alloc.initWithFrame(view.bounds)
    @my_map_view.mapType = MKMapTypeSatellite

    @my_map_view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight

    view.addSubview(@my_map_view)
  end

  def viewDidUnload
    @my_map_view = nil
  end

  def shouldAutorotateToInterfaceOrientation(interfaceOrientation)
    true
  end

end
