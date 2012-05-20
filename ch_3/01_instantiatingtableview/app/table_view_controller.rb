class TableViewController < UITableViewController
  def viewDidLoad
    view.backgroundColor = UIColor.whiteColor
    myTableView = UITableView.alloc.initWithFrame(view.bounds, style:UITableViewStylePlain)
    view.addSubview(myTableView)
  end
end

