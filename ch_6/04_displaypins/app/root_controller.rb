class RootController < UIViewController
  def didReceiveMemoryWarning
    super
  end

  def viewDidLoad
    view.backgroundColor = UIColor.lightGrayColor
    
    @my_map_view = MKMapView.alloc.initWithFrame(view.bounds)
    @my_map_view.mapType = MKMapTypeStandard
    @my_map_view.delegate = self

    @my_map_view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight

    view.addSubview(@my_map_view)

    location = CLLocationCoordinate2DMake(50.82191692907181, -0.13811767101287842)
    annotation = MyAnnotation.alloc.initWithCoordinates(location, title:"My Title", subTitle:"My Subtitle")

    @my_map_view.addAnnotation(annotation)

    #This is extra that wasn't in the chapter
    region = MKCoordinateRegionMake(location, MKCoordinateSpanMake(3.1, 3.1)) 
    @my_map_view.setRegion(region)
  end

  def viewDidUnload
    @my_map_view = nil
  end

  def shouldAutorotateToInterfaceOrientation(interfaceOrientation)
    true
  end

end
