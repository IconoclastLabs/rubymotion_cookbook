class RootController < UIViewController
  def didReceiveMemoryWarning
    super
  end

  def mapView(mapView, viewForAnnotation:annotation)

    senderAnnotation = annotation

    pinReusableIdentifier = MyAnnotation.reusableIdentifierforPinColor(senderAnnotation.pinColor)
    annotationView = @my_map_view.dequeueReusableAnnotationViewWithIdentifier(pinReusableIdentifier)

    if (annotationView.nil?)
      annotationView = MKPinAnnotationView.alloc.initWithAnnotation(senderAnnotation, reuseIdentifier:pinReusableIdentifier)
      annotationView.canShowCallout = true
      # you can't animate a custom pin (so it seems)
      #annotationView.animatesDrop = true
    end

    annotationView.pinColor = senderAnnotation.pinColor

    #new 6.06 code is really all right here
    pinImage = UIImage.imageNamed("ilpin.png")
    annotationView.image = pinImage

    annotationView
  end

  def viewDidLoad
    view.backgroundColor = UIColor.lightGrayColor
    
    @my_map_view = MKMapView.alloc.initWithFrame(view.bounds)
    @my_map_view.mapType = MKMapTypeStandard
    @my_map_view.delegate = self

    @my_map_view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight

    view.addSubview(@my_map_view)

    location = CLLocationCoordinate2DMake(29.9510658, -90.0715323)
    annotation = MyAnnotation.alloc.initWithCoordinates(location, title:"Iconoclast Labs", subTitle:"Apps your parents warned you about")

    @my_map_view.addAnnotation(annotation)

    region = MKCoordinateRegionMake(location, MKCoordinateSpanMake(1, 1)) 
    @my_map_view.setRegion(region, animated:true)
  end

  def viewDidUnload
    @my_map_view = nil
  end

  def shouldAutorotateToInterfaceOrientation(interfaceOrientation)
    true
  end

end
