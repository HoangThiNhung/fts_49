class NotifyNewSubject
  def notify subject
    NewSubject.perform_async subject.id
  end
end
