class MyIpadController < UIViewController
  def viewDidLoad
    @my_table_view = UITableView.alloc.initWithFrame(view.bounds,style:UITableViewStylePlain)
    @my_table_view.dataSource = 
    view.addSubview(@my_table_view)
    @my_detail_view = DetailViewController.alloc.init
    @label = UILabel.alloc.init
    @label.text = "Only iPads see this"
    @label.frame = [[0,0],[250,150]]
    view.addSubview(@label)
  end
end
