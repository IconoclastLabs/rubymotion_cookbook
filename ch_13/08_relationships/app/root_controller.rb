class RootController < UIViewController
  def viewDidLoad
    view.backgroundColor = UIColor.lightGrayColor
  
    self.title = "Core Data"

    @label = UILabel.new
    @label.text = 'No Errors'
    @label.frame = [[0,50],[UIScreen.mainScreen.bounds.size.width,50]]
    view.addSubview(@label)

    #save_core_data
  end

  def save_core_data
    p "Creating company"
    p Manager.entity
    p Employee.entity
    #Company.shared.add_manager do |manager|
    p Company.shared
    #  manager.first_name = "Manager"
    #  manager.last_name = "#{rand(100)}"
    #  manager.age = rand(75)
    #end


  end
end
