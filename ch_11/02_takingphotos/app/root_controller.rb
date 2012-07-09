class RootController < UIViewController
  def viewDidLoad
    super
    view.backgroundColor = UIColor.lightGrayColor
   
    @label = UILabel.new
    @label.text = 'Camera'
    @label.frame = [[0,50],[UIScreen.mainScreen.bounds.size.width,50]]
    view.addSubview(@label)

    if camera_available? && takes_photos?
      @label.text = "Camera Good to Move on"
      p @label.text

      controller = UIImagePickerController.alloc.init
      controller.sourceType = UIImagePickerControllerSourceTypeCamera

      requiredMediaType = kUTTypeImage
      controller.mediaTypes = [requiredMediaType, nil]
      controller.allowsEditing = true
      controller.delegate = self

      self.navigationController.presentModalViewController(controller, animated:true)
    else
      @label.text = "Camera not Available - Probably run in a simulator"
      p @label.text
    end
  end

  # UIImagePickerController Delegate Methods
  def imagePickerController(picker, didFinishPickingMediaWithInfo:info)
    p "Picker returned successfully"
    mediaType = info.objectForKey(UIImagePickerControllerMediaType)

    if mediaType.isEqualToString(kUTTypeMovie)
      video_url = info.objectForKey(UIImagePickerControllerMediaURL)
      @label.text = "Video located at #{video_url}"
      p @label.text
    elsif mediaType.isEqualToString(kUTTypeImage)
      metadata = info.objectForKey(UIImagePickerControllerMediaMetadata)
      the_image = info.objectForKey(UIImagePickerControllerOriginalImage)

      @label.text = "Image = #{the_image}"
      p "Image Metadata = #{metadata}"
      p @label.text 
    end

    picker.dismissModalViewControllerAnimated(true)
  end

  def imagePickerControllerDidCancel(picker)
    @label.text = "Picker was cancelled"
    p @label.text
    picker.dismissModalViewControllerAnimated(true)
  end

  def camera_available?
    UIImagePickerController.isSourceTypeAvailable UIImagePickerControllerSourceTypeCamera 
  end

  def cameraSupportsMedia paramMediaType, paramSourceType
    availableMediaTypes = UIImagePickerController.availableMediaTypesForSourceType(paramSourceType)

    availableMediaTypes.include? paramMediaType
  end

  def shoots_videos?
    cameraSupportsMedia KUTTypeMovie, UIImagePickerControllerSourceTypeCamera
  end

  def takes_photos?
    cameraSupportsMedia KUTTypeImage, UIImagePickerControllerSourceTypeCamera
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
