class UserMailer < ApplicationMailer
  def new_subject subject, user
    @subject = subject
    @user = user
    mail to: @user.email, subject: t("email.new_subject")
  end

  def exam_result exam
    @exam = exam
    @user = exam.user
    mail to: @user.email, subject: t("email.exam_result")    
  end

  def notify_delay exam
    @exam = exam
    @user = exam.user
    mail to: @user.email, subject: t("email.exam_delayed")    
  end

  def send_statistic_every_month exam
    @exam = exam
    @user = exam.user
    mail to: @user.email, subject: t("email.exam_statistic") 
  end
end
