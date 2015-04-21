class RootScreenStylesheet < ApplicationStylesheet

	def root_view st
		st.background_color = color.white
	end

	# def picker st
	# 	st.view.showsSelectionIndicator = true
	# 	st.frame = {centered: :both}
	# end

end