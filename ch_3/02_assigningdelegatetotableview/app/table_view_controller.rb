class TableViewController < UITableViewController
  def viewDidLoad
    view.backgroundColor = UIColor.whiteColor
    @myTableView = UITableView.alloc.initWithFrame(view.bounds, style:UITableViewStylePlain)
    @myTableView.delegate = self
    view.addSubview(@myTableView)
  end

  def tableView(tableView, heighForRowAtIndexPath:indexPath)
    result = 20.0
    result = 40.0 if tableView == @myTableView
    result
  end
end
