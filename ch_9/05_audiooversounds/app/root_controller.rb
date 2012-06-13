class RootController < UIViewController
  def viewDidLoad
    view.backgroundColor = UIColor.lightGrayColor

    # Regular button
    @my_button = UIButton.buttonWithType(UIButtonTypeRoundedRect)
    @my_button.frame = [[110,150],[100,37]]
    @my_button.setTitle("Play Audio", forState:UIControlStateNormal)
    # events
    @my_button.addTarget(self, action:'buttonIsTapped', forControlEvents:UIControlEventTouchUpInside)
    view.addSubview(@my_button)

  end

  def buttonIsTapped
    p "Button was tapped"

    audioSessionError = Pointer.new(:object)
    audioSession = AVAudioSession.sharedInstance
    if audioSession.setCategory(AVAudioSessionCategoryAmbient, error:audioSessionError)
      p "Successfully set the audio session"
    else
      p "Could not set the audio session"
    end
    
    Dispatch::Queue.concurrent.async do 
      mainBundle = NSBundle.mainBundle
      filePath = mainBundle.pathForResource("MySong", ofType:"mp3")
      fileData = NSData.dataWithContentsOfFile(filePath)
      error = Pointer.new(:object)

      @audio_player = AVAudioPlayer.alloc.initWithData(fileData, error:error)

      unless (@audio_player.nil?)
        @audio_player.delegate = self
        if (@audio_player.prepareToPlay && @audio_player.play)
          p "Successfully playing"
        else
          p "Failed to Play"
        end
      else
        p "Failed to instantiate AVAudioPlayer"
      end 
    end
  end

  def audioPlayerBeginInterruption(player)
    # player was paused here
  end

  def audioPLayerEndInterruption(player)
    if (flags == AVAudioSessionInterruptionFlags_ShouldResume && @audio_player != nil)
      @audio_player.play
    end
  end

  def audioPlayerDidFinishPlaying(player, successfully:flag)
    if flag
      p "Audio player stopped correctly"
    else
      p "Audio player did not stop correctly"
    end

    @audio_player = nil
  end
end
