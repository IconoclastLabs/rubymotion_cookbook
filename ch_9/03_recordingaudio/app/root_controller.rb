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

    settings.setValue(NSNumber.numberWithInteger(kAudioFormatAppleLossless), forKey:AVFormatIDKey)
    #settings.setValue(NSNumber.numberWithInteger(1), forKey:AVFormatIDKey)
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
    end
  end

  def viewDidUnload
    super

    if @audio_recorder.isRecording
      @audio_recorder.stop
    end

    @audio_recorder = nil

  end

end
