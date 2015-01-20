class RootScreenStylesheet < ApplicationStylesheet

	def root_view st
		st.background_color = color.gray
	end

	def reg_button st
		st.frame = {l: 110, t: 150, w: 100, h: 37}
		st.corner_radius = 10
		st.background_color = color.white
		st.text = "Press Me"
		st.color = color.black
		#st.view.setTitle("Impressive!", forState:UIControlStateHighlighted)
		st.text_highlighted = "Impressive!"
	end
end