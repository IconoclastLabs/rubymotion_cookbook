class SimpleScreen < PM::Screen
  title "Alert and Sheet"
  stylesheet SimpleScreenStylesheet

  def on_load

    append(UIButton, :alert_controller_alert).on(:tap) do
      rmq.app.alert(title: "Simple Alert", message: "Would you like to see more options?", actions: :yes_no) do |title|
        case title
        when :yes
          UIApplication.sharedApplication.openURL(NSURL.URLWithString("https://github.com/GantMan/RedAlert"))
        when :no
          mp "cool."
        end
      end
    end

    append(UIButton, :alert_controller_sheet).on(:tap) do
      rmq.app.alert(title: "Simple Action Sheet", message: "Would you like to see more options?", actions: :yes_no, style: :sheet) do |title|
        case title
        when :yes
          UIApplication.sharedApplication.openURL(NSURL.URLWithString("https://github.com/GantMan/RedAlert"))
        when :no
          mp "cool."
        end
      end
    end

  end

end