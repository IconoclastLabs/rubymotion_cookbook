class RootScreen < PM::TableScreen
  title "Custom Table Screen"
	row_height 40
  stylesheet CustomCellStylesheet

  def on_load
    @data
  end

  def table_data
    @data =
    [{
      cells:
      [{
        title: "This is Cell 1",
        cell_class: CustomCell,
      	},
      	{
        title: "This is Cell 2",
        cell_class: CustomCell,
      }]
    }]
  end
end