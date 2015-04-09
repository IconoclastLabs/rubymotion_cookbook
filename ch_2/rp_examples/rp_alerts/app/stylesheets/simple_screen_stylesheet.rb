class SimpleScreenStylesheet < ApplicationStylesheet

  def root_view(st)
    st.background_color = color.white
  end

  def alert_controller_alert st
    basic_button(st)
    st.frame = {t: 100}
    st.text = "Simple Alert"
  end

  def alert_controller_sheet st
    basic_button(st)
    st.text = "Simple Action Sheet"
  end


end