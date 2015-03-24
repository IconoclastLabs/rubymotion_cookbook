module RubyMotionQuery
  module Stylers

    class UIDatePickerStyler < UIControlStyler

    	DATE_PICKER_MODES = {
    		time: UIDatePickerModeTime,
   			date: UIDatePickerModeDate,
   			date_and_time: UIDatePickerModeDateAndTime,
   			date_time: UIDatePickerModeDateAndTime,
   			countdown: UIDatePickerModeCountDownTimer,
   			count_down: UIDatePickerModeCountDownTimer,
   			count_down_timer: UIDatePickerModeCountDownTimer,
    	}

    	def date_picker_mode=(value)
    		@view.datePickerMode = DATE_PICKER_MODES[value] || value
    	end

      def date_picker_mode
      	@view.datePickerMode
      end
    end

  end
end