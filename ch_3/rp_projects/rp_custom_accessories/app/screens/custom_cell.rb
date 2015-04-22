class CustomCell < PM::TableViewCell
	attr_accessor :input_text

  def on_load
    @user_text = rmq.append(UITextField, :input_text_style)
    rmq.all.reapply_styles
  end

  def input_text= some_text
    @user_text.get.text = some_text
  end
end