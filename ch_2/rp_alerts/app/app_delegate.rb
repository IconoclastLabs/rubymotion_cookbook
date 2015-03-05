class AppDelegate < PM::Delegate
  status_bar true, animation: :fade

  def on_load(app, options)
    alert_view = rmq.alert('Ackbar Says', "It's a trap!", cancel_button='Cancel', other_buttons=['OK'], delegate=self, UIAlertViewStyleLoginAndPasswordInput).get
    # TODO add changing keyboard to rmq_alert gem
    text = alert_view.textFieldAtIndex  0
    text.keyboardType = UIKeyboardTypeNamePhonePad

    true
  end
end
