class RootController < UIViewController
  def viewDidLoad
    super
    if self.photo_library_available? && self.pick_videos_from_library?
      image_picker = UIImagePickerController.alloc.init
      image_picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary

      media_types = [KUTTypeMovie]
      image_picker.mediaTypes = media_types
      image_picker.delegate = self

      # present the image picker
      self.navigationController.presentModalViewController(image_picker, animated: true)
    end
  end

  def viewDidAppear animated
    super
    view.backgroundColor = UIColor.lightGrayColor
    @label = UILabel.new
    @label.text = 'Camera'
    @label.frame = [[0,50],[UIScreen.mainScreen.bounds.size.width,50]]
    view.addSubview(@label)

    unless @video_url_to_edit.nil?
      video_path = @video_url_to_edit.path

      #verify it CAN edit the video at the path
      if UIVideoEditorController.canEditVideoAtPath(video_path)
        #instantiate video editor
        video_editor = UIVIdeoEditorController.alloc.init
        video_editor.delegate = self
        video_editor.videoPath = video_path
        self.navigationController.presentModalViewController(video_editor, animated:true)

        @video_url_to_edit = nil
      else
        @label.text = "Cannot edit the video at this path"
        p @label.text
      end

    end
  end

  def videoEditorController(editor, didSaveEditedVideoToPath:editedVideoPath)
    @label.text = "Video finished saving at #{editedVideoPath}"
    p @label.text
  end

  def videoEditorController(editor, didFailWithError:error)
    @label.text = "This error ocurred: #{error[0].description}"
    p @label.text
  end

  def videoEditorControllerDidCancel(editor)
    @label.text = "Video editor was cancelled"
    p @label.text
  end

  def photo_library_available?
    UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceTypePhotoLibrary)
  end

  def pick_videos_from_library?
    cameraSupportsMedia KUTTypeMovie, UIImagePickerControllerSourceTypePhotoLibrary
  end

  def pick_photos_from_library?
    cameraSupportsMedia KUTTypeImage, UIImagePickerControllerSourceTypePhotoLibrary
  end

  def imageWasSavedSuccessfully
    @label.text = "Image save successfully"
    p @label.text
  end

  # UIImagePickerController Delegate Methods
  def imagePickerController(picker, didFinishPickingMediaWithInfo:info)
    p "Picker returned successfully"
    p info

    mediaType = info.objectForKey(UIImagePickerControllerMediaType)

    if mediaType.isEqualToString(KUTTypeMovie)
      video_url = info.objectForKey(UIImagePickerControllerMediaURL)
      @label.text = "Video located at #{video_url}"
      p @label.text

      @video_url_to_edit = video_url
    elsif mediaType.isEqualToString(KUTTypeImage)
      metadata = info.objectForKey(UIImagePickerControllerMediaMetadata)
      the_image = info.objectForKey(UIImagePickerControllerOriginalImage)

      @label.text = "Image = #{the_image}"
      p "Image Metadata = #{metadata}"
      p @label.text 

      UIImageWriteToSavedPhotosAlbum(the_image, self, 'imageWasSavedSuccessfully', nil)

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
