class RootController < UIViewController

  def viewDidLoad
    view.backgroundColor = UIColor.lightGrayColor
    @label = UILabel.new
    @label.text = 'Info Loading'
    @label.frame = [[0,50],[UIScreen.mainScreen.bounds.size.width,150]]
    @label.numberOfLines = 0
    view.addSubview(@label)
    
    oreillyAddress = "1005 Gravenstein Highway North, Sebastopol, CA 95472, USA"
    @my_geocoder = CLGeocoder.alloc.init

    @my_geocoder.geocodeAddressString(oreillyAddress, completionHandler:lambda do |placemarks, error|
      if (error.nil? && placemarks.count > 0)
        @label.text = "Found #{placemarks.count} placemark(s)"
        placemark = placemarks.objectAtIndex(0)
        @label.text += "\nThe First placemark: Longitude = #{placemark.location.coordinate.longitude} and Latitude = #{placemark.location.coordinate.latitude}"
      elsif (error.nil? && placemarks.count == 0)
        @label.text = "No results were returned"
      else
        @label.text = "Error occurred = #{error}"
      end
    end)
  end

  def viewDidUnload
    @my_geocoder = nil
  end

end
