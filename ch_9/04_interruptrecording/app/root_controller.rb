class RootController < UIViewController
  def viewDidLoad
    view.backgroundColor = UIColor.lightGrayColor
    
    error = Pointer.new(:object)
    pathAsString = self.audioRecordingPath

    audioRecordingURL = NSURL.fileURLWithPath(pathAsString)

    @audio_recorder = AVAudioRecorder.alloc.initWithURL(audioRecordingURL, settings:self.audioRecordingSettings, error:error)

    unless @audio_recorder.nil?
      @audio_recorder.delegate = self

      #prep to start recording
      if @audio_recorder.prepareToRecord && @audio_recorder.record
        p "Succesfully started recording"
        self.performSelector('stopRecordingOnAudioRecorder:', withObject:@audio_recorder, afterDelay:5)
      else
        p "Failed to record"
        @audio_recorder = nil
      end
    else
      p "Failed to create instance of audio recorder"
    end 

  end

  def audioRecorderBeginInterruption recorder
    p "Recording process interrupted"
  end

  def audioRecorderEndInterruption(recorder, withFlags:flags)
    if (flags == AVAudioSessionInterruptionFlags_ShouldResume)
      p "Resuming Recording"
      recorder.record
    end
  end

  def audioRecordingPath
    result = nil
    # e.g. /var/mobile/Applications/ApplicationID/Documents/
    folders = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, true)
    documentsFolder = folders.objectAtIndex(0)
    # appends file
    result = documentsFolder.stringByAppendingPathComponent("Recording.m4a")

    result
  end

  def audioRecordingSettings
    result = nil
    settings = NSMutableDictionary.alloc.init

    settings.setValue(NSNumber.numberWithInteger(KAudioFormatAppleLossless), forKey:AVFormatIDKey)
    settings.setValue(NSNumber.numberWithFloat(44100.0), forKey:AVSampleRateKey)
    settings.setValue(NSNumber.numberWithInteger(1), forKey:AVNumberOfChannelsKey)
    settings.setValue(NSNumber.numberWithInteger(AVAudioQualityLow), forKey:AVEncoderAudioQualityKey)

    result = NSDictionary.dictionaryWithDictionary(settings)
    result
  end

  def stopRecordingOnAudioRecorder(paramRecorder)
    # Does not happen instantaneously
    paramRecorder.stop
  end

  def audioRecorderDidFinishRecording(recorder, successfully:flag)
    if flag
      p "Successfully stopped the audio recording process"

      Dispatch::Queue.concurrent.async do
        playbackError = Pointer.new(:object)
        readingError = Pointer.new(:object)
        fileData = NSData.dataWithContentsOfFile(self.audioRecordingPath, options:NSDataReadingMapped, error:readingError)
        @audio_player = AVAudioPlayer.alloc.initWithData(fileData, error:playbackError)

        unless @audio_player.nil?
          @audio_player.delegate = self

          if @audio_player.prepareToPlay && @audio_player.play
            p "Started playing the recorded audio"
          else
            p "Could not play the audio"
          end
        else
          p "failed to create audio player"
        end
      end
    else
      p "Stopping the audio recording failed"
    end

    # one trick pony
    @audio_recorder = nil
    @audio_player = nil
  end

  def viewDidUnload
    super

    @audio_recorder.stop if @audio_recorder.recording?
    @audio_player.stop if @audio_player.playing?

    @audio_recorder = nil
    @audio_player = nil

  end

end
