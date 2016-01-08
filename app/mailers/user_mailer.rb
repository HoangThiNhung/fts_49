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
end
