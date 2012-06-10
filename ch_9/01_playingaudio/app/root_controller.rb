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
end
