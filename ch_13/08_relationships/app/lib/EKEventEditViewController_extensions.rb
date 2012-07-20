class EKEventEditViewController
  def saveEvent
    error_ptr = Pointer.new(:object)
    eventStore.saveEvent(event, span:EKSpanThisEvent, error:error_ptr)
    error_ptr
  end
  
  def removeEvent
    error_ptr = Pointer.new(:object)
    eventStore.removeEvent(event, span:EKSpanThisEvent, error:error_ptr)
    error_ptr
  end
end
