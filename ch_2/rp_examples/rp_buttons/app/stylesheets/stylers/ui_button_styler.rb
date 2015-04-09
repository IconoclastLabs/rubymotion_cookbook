module RubyMotionQuery
	module Stylers
		class UIButtonStyler < UIControlStyler

			def text_highlighted value
				@view.setTitle(value, forState:UIControlStateHighlighted)
			end

			def text_highlighted= value
				@view.setTitle(value, forState:UIControlStateHighlighted)
			end

		end
	end
end