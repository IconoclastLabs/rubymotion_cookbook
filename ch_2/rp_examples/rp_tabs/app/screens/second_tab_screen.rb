class SecondTabScreen < PM::Screen
  title 'Second Tab'
  tab_bar_item title: 'Second Tab', item: 'SecondTab'
	stylesheet RootScreenStylesheet
  def on_load
    set_nav_bar_button :back, title: '', style: :plain, action: :back

    append(UILabel, :second_tab_label_style)
  end
end