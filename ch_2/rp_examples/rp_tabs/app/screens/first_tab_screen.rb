class FirstTabScreen < PM::Screen
  title 'First Tab'
  tab_bar_item title: 'First Tab', item: 'FirstTab'
  stylesheet RootScreenStylesheet
  def on_load
    set_nav_bar_button :back, title: '', style: :plain, action: :back

    append(UILabel, :first_tab_label_style)
  end
end