class RootController < UIViewController
  def displayMediaPickerAndPlayItem
    media_picker = MPMediaPickerController.alloc.initWithMediaTypes(MPMediaTypeAny)

    unless media_picker.nil?
      p "Successfully instatiated a media picker"
      media_picker.delegate = self
      media_picker.allowsPickingMultipleItems = false

      self.navigationController.presentModalViewController(media_picker, animated:true)
    else
      p "Could not instantiated media picker"
    end

  end

  def mediaPicker(media_picker, didPickMediaItems:mediaItemCollection)
    p "Media Picker returned"

    @music_player = nil

    @music_player = MPMusicPlayerController.alloc.init
    @music_player.beginGeneratingPlaybackNotifications

    NSNotificationCenter.defaultCenter.addObserver(self, 'musicPlayerStateChanged:', name:MPMusicPlayerControllerPlaybackStateDidChangeNotification, object:@music_player)
    NSNotificationCenter.defaultCenter.addObserver(self, 'nowPlayingItemIsChanged:', name:MPMusicPlayerControllerNowPlayingItemDidChangeNotification, object:@music_player)
    NSNotificationCenter.defaultCenter.addObserver(self, 'volumeIsChanged:', name:MPMusicPlayerControllerVolumeDidChangeNotification, object:@music_player)
    
    @music_player.setQueueWithItemCollection(mediaItemCollection)
    @music_player.play

    mediaItemCollection.each do |this_item| 
      item_url = this_item.valueForProperty(MPMediaItemPropertyAssetURL)
      item_title = this_item.valueForProperty(MPMediaItemPropertyTitle)
      item_artist = this_item.valueForProperty(MPMediaItemPropertyArtist)
      item_artwork = this_item.valueForProperty(MPMediaItemPropertyArtwork)

      p "Item URL = #{item_url}"
      p "Item Title = #{item_title}"
      p "Item Artist = #{item_artist}"
      p "Item Artwork = #{item_artwork}"
    end   

    media_picker.dismissModalViewControllerAnimated(true)
  end

  def mediPickerDidCancel(mediaPicker)
    p "Media Picker was cancelled"
    mediaPicker.dismissModalViewControllerAnimated(true)
  end

  def musicPlayerStateChanged(paramNotification)
    p "Player State Changed"
    stateAsObject = paramNotification.userInfo.objectForKey("MPMusicPlayerControllerPlaybackStateKey")
    state = stateAsObject.integerValue

    message = case state
              when MPMusicPlaybackStateStopped then "Player stopped playing the queue"
              when MPMusicPlaybackStatePlaying then "Player is playing"
              when MPMusicPlaybackStatePaused then "Player is paused"
              when MPMusicPlaybackStateInterrupted then "Player interrupted"
              when MPMusicPlaybackStateSeekingForward then "User is seeking forward in queue"
              when MPMusicPlaybackStateSeekingBackward then "User is seeking backward in queue"
              else "WTF?"
    end
  end

  def nowPlayingItemIsChanged(paramNotification)
    p "Playing item is changed"

    persistentID = paramNotification.userInfo.objectForKey("MPMusicPlayerControllerNowPlayingItemPersistentIDKey")

    p "Persistent ID = #{persistentID}"
  end

  def volumeIsChanged(paramNotification)
    p "Volume is changed"
  end

  def viewDidLoad
    view.backgroundColor = UIColor.lightGrayColor

    # Regular button
    @my_button_play = UIButton.buttonWithType(UIButtonTypeRoundedRect)
    @my_button_play.frame = [[0,0],[200,37]]
    @my_button_play.setTitle("Pick and Play", forState:UIControlStateNormal)
    # events
    @my_button_play.addTarget(self, action:'displayMediaPickerAndPlayItem', forControlEvents:UIControlEventTouchUpInside)
    view.addSubview(@my_button_play)

    @my_button_stop = UIButton.buttonWithType(UIButtonTypeRoundedRect)
    @my_button_stop.frame = @my_button_play.frame
    @my_button_stop.center = CGPointMake(view.center.x, view.center.y + 50)
    @my_button_stop.setTitle("Stop", forState:UIControlStateNormal)
    @my_button_stop.addTarget(self, action:'stopPlayingAudio', forControlEvents:UIControlEventTouchUpInside)
    view.addSubview(@my_button_stop)

    self.navigationController.setNavigationBarHidden(true, animated:false)
  end

  def stopPlayingAudio
    unless @music_player.nil?
      NSNotificationCenter.defaultCenter.removeObserver(self, name:MPMusicPlayerControllerPlaybackStateDidChangeNotification, object:@music_player)
      NSNotificationCenter.defaultCenter.removeObserver(self, name:MPMusicPlayerControllerNowPlayingItemDidChangeNotification, object:@music_player)
      NSNotificationCenter.defaultCenter.removeObserver(self, name:MPMusicPlayerControllerVolumeDidChangeNotification, object:@music_player)

      @music_player.stop
    end
  end

  def viewDidUnload
    super
    self.stopPlayingAudio
    @music_player = nil
  end
end
