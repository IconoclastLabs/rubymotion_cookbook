class UINavigationControllerDoneCancel < UINavigationController
  def self.withRootViewController(controller, target:target, done:done, cancel:cancel)
    navigation = UINavigationController.alloc.initWithRootViewController(controller)
    controller.navigationItem.rightBarButtonItem  = UIBarButtonItemDone.withTarget(target, action:done)
    controller.navigationItem.leftBarButtonItem = UIBarButtonItemCancel.withTarget(target, action:cancel)
    navigation
  end
end
