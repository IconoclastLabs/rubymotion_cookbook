class SecondViewController < UIViewController
  def viewDidLoad
    self.view.backgroundColor = UIColor.greenColor
    self.title = 'Secondary'

    #self.performSelector('goBack', nil, afterDelay:5.0)
  end

  def goBack
    self.navigationController.popViewControllerAnimated('yes')
  end
end
