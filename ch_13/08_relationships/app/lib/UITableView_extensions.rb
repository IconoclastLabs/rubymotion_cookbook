class UITableView
  def updates
    beginUpdates
    yield
    endUpdates
  end
  
  def insertOrDeleteRowsAtIndexPaths(rows, withRowAnimation:animation, inserting:boolean)
    if boolean then
      insertRowsAtIndexPaths(rows, withRowAnimation:animation)
    else
      deleteRowsAtIndexPaths(rows, withRowAnimation:animation)
    end
  end
end
    