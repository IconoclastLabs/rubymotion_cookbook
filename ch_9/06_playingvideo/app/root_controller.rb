class RootController < UIViewController
  def startPlayingVideo(paramSender)
    mainBundle = NSBundle.mainBundle
    urlAsString = mainBundle.pathForResource("Sample", ofType:"m4v")
    url = NSURL.fileURLWithPath(urlAsString)

    stopPlayingVideo(nil) unless @movie_player.nil?

    @movie_player = MPMoviePlayerController.alloc.initWithContentURL(url)

    unless @movie_player.nil?
      NSNotificationCenter.defaultCenter.addObserver(self, selector:'videoHasFinishedPlaying:', name:MPMoviePlayerPlaybackDidFinishNotification, object:@movie_player)
      p "Successfully instantiated movie player"
      @movie_player.scalingMode = MPMovieScalingModeAspectFit
      @movie_player.play
      view.addSubview(@movie_player.view)
      @movie_player.setFullscreen(true, animated:true)
    else
      p "Failed to instantiate the movie player"      
    end
  end

  def stopPlayingVideo(paramSender)
    unless @movie_player.nil?
      NSNotificationCenter.defaultCenter.removeObserver(self, name:MPMoviePlayerPlaybackDidFinishNotification, object:@movie_player)
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
    @play_button.frame = [[0,0],[70, 37]]
    @play_button.center = view.center
    
    @play_button.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleRightMargin

    @play_button.addTarget(self, action:'startPlayingVideo:', forControlEvents:UIControlEventTouchUpInside)
    @play_button.setTitle("Play", forState:UIControlStateNormal)
    view.addSubview(@play_button)

  end

end
