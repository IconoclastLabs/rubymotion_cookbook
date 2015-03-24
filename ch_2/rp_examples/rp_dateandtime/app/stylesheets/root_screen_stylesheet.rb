class RootScreenStylesheet < ApplicationStylesheet

	def root_view st
		st.background_color = color.white
	end

	# def picker st
	# 	st.view.showsSelectionIndicator = true
	# 	st.frame = {centered: :both}
	# end

	def sexy_label st
		st.text = "Picker Results"
		st.frame = {l: 0, t: 0, w: 250, h: 150}
	end

  def date_picker_style st
  	st.frame = {centered: :both}
  	st.date_picker_mode = :date_time
  end
end