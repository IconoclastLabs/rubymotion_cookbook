class RootController < UIViewController
  def startPlayingVideo(paramSender)
    mainBundle = NSBundle.mainBundle
    urlAsString = mainBundle.pathForResource("Sample", ofType:"m4v")
    url = NSURL.fileURLWithPath(urlAsString)

    stopPlayingVideo(nil) unless @movie_player.nil?

    @movie_player = MPMoviePlayerController.alloc.initWithContentURL(url)

    unless @movie_player.nil?
      NSNotificationCenter.defaultCenter.addObserver(self, selector:'videoHasFinishedPlaying:', name:MPMoviePlayerPlaybackDidFinishNotification, object:@movie_player)
      NSNotificationCenter.defaultCenter.addObserver(self, selector:'videoThumbnailIsAvailable:', name:MPMoviePlayerThumbnailImageRequestDidFinishNotification, object:@movie_player)
      p "Successfully instantiated movie player"
      @movie_player.scalingMode = MPMovieScalingModeAspectFit
      @movie_player.play
      view.addSubview(@movie_player.view)
      @movie_player.setFullscreen(true, animated:true)

      #9.07 Capture frome 3 seconds into film
      thumbnail = NSNumber.numberWithFloat(3.0)

      # for now just capture one frame
      request_thumbnails = NSArray.arrayWithObject(thumbnail)

      #ask to catpure
      @movie_player.requestThumbnailImagesAtTimes(request_thumbnails, timeOption:MPMovieTimeOptionExact)

    else
      p "Failed to instantiate the movie player"      
    end
  end

  def videoThumbnailIsAvailable(paramNotification)
    controller = paramNotification.object

    if controller == @movie_player
      p "Thumbnail is available"
      thumbnail = paramNotification.userInfo.objectForKey(MPMoviePlayerThumbnailImageKey)
      my_image_view = UIImageView.alloc.initWithFrame(self.view.bounds)
      my_image_view.contentMode = UIViewContentModeScaleAspectFit
      my_image_view.image = thumbnail
      my_image_view.center = self.view.center
      view.addSubview(my_image_view)
      p "Thumbnail is being shown now"

    end

  end

  def stopPlayingVideo(paramSender)
    unless @movie_player.nil?
      NSNotificationCenter.defaultCenter.removeObserver(self, name:MPMoviePlayerPlaybackDidFinishNotification, object:@movie_player)
      NSNotificationCenter.defaultCenter.removeObserver(self, name:MPMoviePlayerThumbnailImageRequestDidFinishNotification, object:@movie_player)
      @movie_player.stop

      @movie_player.view.removeFromSuperview
    end
  end

  def viewDidUnload
    @play_button = nil
    self.stopPlayingVideo(nil)
    @movie_player = nil
    super
  end

  def videoHasFinishedPlaying(paramNotification)
    reason = paramNotification.userInfo.valueForKey(MPMoviePlayerPlaybackDidFinishReasonUserInfoKey)
    text_reason = "Reason was nil"

    unless reason.nil?
      text_reason = case reason.integerValue
                    when MPMovieFinishReasonPlaybackEnded then "Ended Normal"
                    when MPMovieFinishReasonPlaybackError then "Error caused end"
                    when MPMovieFinishReasonUserExicted then "User exited"
                    else "Else end"
      end 

      p "Finish Reason: " + text_reason
      self.stopPlayingVideo(nil)
    end
  end

  def viewDidLoad
    view.backgroundColor = UIColor.lightGrayColor
    
    @play_button = UIButton.buttonWithType(UIButtonTypeRoundedRect)
    @play_button.frame = [[120,50],[70, 37]]
    # This is commented out now bc we don't want the thumbnail to cover it
    #@play_button.center = view.center
    
    @play_button.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleRightMargin

    @play_button.addTarget(self, action:'startPlayingVideo:', forControlEvents:UIControlEventTouchUpInside)
    @play_button.setTitle("Play", forState:UIControlStateNormal)
    view.addSubview(@play_button)

  end

end
