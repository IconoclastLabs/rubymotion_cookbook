class UIBarButtonItemPlain < UIBarButtonItem
  def self.withTitle(title, target:target, action:action)
    UIBarButtonItem.alloc.initWithTitle(title, style:UIBarButtonItemStylePlain, target:target, action:action)
  end
end

class UIBarButtonItemEdit < UIBarButtonItem
  def self.withTarget(target, action:action)
    UIBarButtonItem.alloc.initWithBarButtonSystemItem(UIBarButtonSystemItemEdit, target:target, action:action)
  end
end

class UIBarButtonItemAdd < UIBarButtonItem
  def self.withTarget(target, action:action)
    UIBarButtonItem.alloc.initWithBarButtonSystemItem(UIBarButtonSystemItemAdd, target:target, action:action)
  end
end

class UIBarButtonItemDone < UIBarButtonItem
  def self.withTarget(target, action:action)
    UIBarButtonItem.alloc.initWithBarButtonSystemItem(UIBarButtonSystemItemDone, target:target, action:action)
  end
end

class UIBarButtonItemCancel < UIBarButtonItem
  def self.withTarget(target, action:action)
    UIBarButtonItem.alloc.initWithBarButtonSystemItem(UIBarButtonSystemItemCancel, target:target, action:action)
  end
end

