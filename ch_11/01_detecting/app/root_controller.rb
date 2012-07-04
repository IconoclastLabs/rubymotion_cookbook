class RootController < UIViewController
  def viewDidLoad
    view.backgroundColor = UIColor.lightGrayColor
   
    @label = UILabel.new
    @label.text = 'Camera Detection'
    @label.frame = [[0,50],[UIScreen.mainScreen.bounds.size.width,50]]
    view.addSubview(@label)

    if camera_available?
      @label.text = "Camera is Available"
      p @label.text

      p "Shoots Videos" if shoots_videos?
      p "Takes Photos" if takes_photos?
      p "Has a Front Camera" if has_front_camera?
      p "Has a Back Camera" if has_rear_camera?
      p "Front Camera has a Flash" if front_camera_flash?
      p "Back Camera has a Flash" if rear_camera_flash?
    else
      @label.text = "Camera not Available - Probably run in a simulator"
      p @label.text
    end
  end


  def camera_available?
    UIImagePickerController.isSourceTypeAvailable UIImagePickerControllerSourceTypeCamera 
  end

  def cameraSupportsMedia paramMediaType, paramSourceType
    availableMediaTypes = UIImagePickerController.availableMediaTypesForSourceType(paramSourceType)

    availableMediaTypes.include? paramMediaType
  end

  def shoots_videos?
    cameraSupportsMedia kUTTypeMovie, UIImagePickerControllerSourceTypeCamera
  end

  def takes_photos?
    cameraSupportsMedia kUTTypeImage, UIImagePickerControllerSourceTypeCamera
  end

  def has_front_camera?
    UIImagePickerController.isCameraDeviceAvailable UIImagePickerControllerCameraDeviceFront 
  end

  def has_rear_camera?
    UIImagePickerController.isCameraDeviceAvailable UIImagePickerControllerCameraDeviceRear 
  end

  def front_camera_flash?
    UIImagePickerController.isFlashAvailableForCameraDevice UIImagePickerControllerCameraDeviceFront 
  end

  def rear_camera_flash?
    UIImagePickerController.isFlashAvailableForCameraDevice UIImagePickerControllerCameraDeviceRear 
  end


end
