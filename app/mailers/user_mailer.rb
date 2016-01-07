class UserMailer < ApplicationMailer
  def exam_result exam 
    @exam = exam
    @user = exam.user
    mail to: @user.email, subject: t "email.exam_result"    
  end
end
