class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    gameController = GameController.alloc.initWithStyle(UITableViewStylePlain)
    gameNav = UINavigationController.alloc.initWithRootViewController(gameController)    

    gamesController = GamesController.alloc.init
    gamesNav = UINavigationController.alloc.initWithRootViewController(gamesController)    
    gamesController.delegate = gameController    

    controller = if UIDevice.ipad? then
      splitViewController = UISplitViewController.alloc.init.tap do |spl|
        spl.delegate = gameController
        spl.viewControllers = [gamesNav, gameNav]
      end
      splitViewController
    else
      gamesNav
    end
    
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.rootViewController = controller
    @window.makeKeyAndVisible
    true
  end
end
