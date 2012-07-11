class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @assetsLibrary = ALAssetsLibrary.alloc.init

    videoURL = NSBundle.mainBundle.URLForResource("MyVideo", withExtension:"MOV")

    unless videoURL.nil?
      @assetsLibrary.writeVideoAtPathToSavedPhotosAlbum(videoURL, completionBlock:lambda do |assetURL, error|
          if error.nil?
            p "No Errors: I saved a video in your library"
          else
            p "error happened saving the video"
          end
        end)
    else
      p "Could not find video in the app bundle"
    end
    
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    #@window.rootViewController = UINavigationController.alloc.initWithRootViewController(RootController.alloc.init)
    #@window.rootViewController.wantsFullScreenLayout = true
    @window.backgroundColor = UIColor.whiteColor
    @window.makeKeyAndVisible
    true
  end
end
