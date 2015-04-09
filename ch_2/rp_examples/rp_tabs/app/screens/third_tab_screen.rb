class ThirdTabScreen < PM::Screen
  title 'Third Tab'
  tab_bar_item title: 'Third Tab', item: 'ThirdTab'
	stylesheet RootScreenStylesheet
  def on_load
    set_nav_bar_button :back, title: '', style: :plain, action: :back

  	append(UILabel, :third_tab_label_style)
  end
end