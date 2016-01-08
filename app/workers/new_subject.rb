class NewSubject
  include Sidekiq::Worker
  def perform id
    @subject = Subject.find id
    User.all.each do |user|
      UserMailer.new_subject(@subject, user).deliver_now
    end
  end
end
