class ExamsController < ApplicationController
  before_action :check_subject, only: [:create]
  before_action :authenticate_user!
  before_action :load_exam, only: [:show, :update]

  def index
    @exam = Exam.new
    @exams = current_user.exams.order "created_at DESC"
    @subjects = Subject.all
  end

  def show
    if @exam.start?
      @time_start = Time.now.to_i
      @exam.update_attributes time_start: @time_start, status: :testing
    else
      @time_start = @exam.time_start
    end
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

  def update
    @exam.time_end = Time.now.to_i
    @exam.status = :unchecked if params[:commit] == "Finish"
    if @exam.update_attributes exam_params
      flash[:success] = t "flash.save_question"
    else
      flash[:danger] =  t "flash.save_question_failed"
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
    params.require(:exam).permit :subject_id, :duration, :status,
      results_attributes: [:id, :option_id]
  end

  def load_exam
    @exam = Exam.find params[:id]
  end
end
