class RootScreenStylesheet < ApplicationStylesheet

	def root_view st
		st.background_color = color.white
	end

	def status_label st
		st.frame = {t: 150, w: 150, h: 50, centered: :horizontal}
		st.text = "Switch Status"
	end


	def switchy st
		st.frame = {t:200, w: 150, h: 50, centered: :horizontal}
	end

end