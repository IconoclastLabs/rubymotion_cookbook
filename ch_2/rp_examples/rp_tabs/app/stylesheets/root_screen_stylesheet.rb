class RootScreenStylesheet < ApplicationStylesheet

	def root_view st
		st.background_color = color.white
	end

	def first_tab_label_style st
		st.text = "First Tab"
    tabs_frame st
	end

	def second_tab_label_style st
		st.text = "Second Tab"
    tabs_frame st
	end

	def third_tab_label_style st
		st.text = "Third Tab"
		tabs_frame st
  end

  def tabs_frame st
  	st.frame = {grid: "e7:h7", centered: :horizontal}
  	st.center_x = 200
  end
end