class ExamsController < ApplicationController
  before_action :check_subject, only: [:create]
  before_action :authenticate_user!

  def index
    @exam = Exam.new
    @exams = current_user.exams.order "created_at DESC"
    @subjects = Subject.all
  end

  def create
    @exam = current_user.exams.build exam_params
    if @exam.save
      flash[:success] = t "flash.create_exam_success"
    else
      flash[:danger] = t "flash.create_exam_failed"
    end
    redirect_to exams_path
  end

  private
  def check_subject
    @subject = Subject.find params[:exam][:subject_id]
    if @subject.questions.size < 1
      flash[:danger] = t "errors.subject_no_question"
      redirect_to exams_path
    end
  end

  def exam_params
    params.require(:exam).permit :subject_id, :duration, :status
  end
end
