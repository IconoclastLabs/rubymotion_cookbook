class ApplicationStylesheet < RubyMotionQuery::Stylesheet

  def application_setup

    # An example of setting standard fonts and colors
    font_family = 'Helvetica Neue'
    font.add_named :large,    font_family, 36
    font.add_named :medium,   font_family, 24
    font.add_named :small,    font_family, 16
    font.add_named :tiny,     font_family, 13

    color.add_named :tint, '236EB7'
    color.add_named :translucent_black, color.from_rgba(0, 0, 0, 0.4)
    color.add_named :battleship_gray,   '#7F7F7F'
  end

  def basic_button st
    st.frame = {bp: 5, l: 10, w: screen_width - 20, h: 50, centered: :horizontal}
    st.corner_radius = 5
    st.background_color = color.blue
  end

end