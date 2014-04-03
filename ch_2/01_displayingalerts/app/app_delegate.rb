class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    alert = UIAlertView.alloc.initWithTitle "Ackbar says",
                                            message: "It's a trap!",
                                            delegate: self,
                                            cancelButtonTitle: "Cancel",
                                            otherButtonTitles: "OK", nil
    alert.alertViewStyle = UIAlertViewStyleLoginAndPasswordInput
    text = alert.textFieldAtIndex 0
    text.keyboardType = UIKeyboardTypeNamePhonePad
    alert.show
    
    true
  end
end
