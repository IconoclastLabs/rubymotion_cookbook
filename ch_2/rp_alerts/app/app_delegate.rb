class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    rootViewController = UIViewController.alloc.init
    rootViewController.title = 'Alert'
    rootViewController.view.backgroundColor = UIColor.whiteColor

    navigationController = UINavigationController.alloc.initWithRootViewController(rootViewController)

    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.rootViewController = navigationController
    @window.makeKeyAndVisible
    alert_view = rmq.alert('Ackbar Says', "It's a trap!", cancel_button='Cancel', other_buttons=['OK'], delegate=self, UIAlertViewStyleLoginAndPasswordInput).get
    # TODO add changing keyboard to rmq_alert gem
    text = alert_view.textFieldAtIndex  0
    text.keyboardType = UIKeyboardTypeNamePhonePad

    true
  end
end
