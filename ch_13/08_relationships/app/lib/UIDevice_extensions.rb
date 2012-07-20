class UIDevice
  def self.ipad?
    currentDevice.userInterfaceIdiom == UIUserInterfaceIdiomPad
  end
  
  def self.portrait?
    currentDevice.orientation == UIDeviceOrientationPortrait
  end
end