class CustomCellStylesheet < ApplicationStylesheet

	def root_view(st)
	end

	def input_text_style(st)
		st.background_color = color.red
		st.frame = {w: 100, h: 20, t: 10, l: 250}
		st.placeholder = "Text"
		st.text_alignment = :center
		st.keyboard_type = :default
	end
end