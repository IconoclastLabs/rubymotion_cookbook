class RootController < UIViewController

  def viewDidLoad
    view.backgroundColor = UIColor.lightGrayColor
    @label = UILabel.new
    @label.text = 'Info Loading'
    @label.frame = [[0,50],[UIScreen.mainScreen.bounds.size.width,150]]
    @label.numberOfLines = 0
    view.addSubview(@label)
    
    location = CLLocation.alloc.initWithLatitude(29.9510658, longitude:-90.0715323)
    @my_geocoder = CLGeocoder.alloc.init

    @my_geocoder.reverseGeocodeLocation(location, completionHandler:lambda do |placemarks, error|
      if (error.nil? && placemarks.count > 0)
        placemark = placemarks.objectAtIndex(0)
        @label.text = "Country = #{placemark.country} \nPostal Code = #{placemark.postalCode} \nLocality = #{placemark.locality}"
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
