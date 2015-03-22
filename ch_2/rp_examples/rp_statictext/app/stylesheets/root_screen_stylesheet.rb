class RootScreenStylesheet < ApplicationStylesheet

	def root_view st
		st.background_color = color.white
	end

	def status_label st
		st.frame = {t: 150, w: screen_width - 10, h: 200, centered: :horizontal}
		st.text = "Making the world a better place, starts with one more smiling face. And Ronald's smile is just the thing, To make everybody sing! Put a smile on, put a smile on, everybody come on! Put a smile on!"
		st.font = font.system(24)
		st.number_of_lines = 5
		st.adjusts_font_size = true
		st.text_alignment = :center
	end
end