class QuestionsController < ApplicationController
  before_action :load_subjects, only: [:index, :new, :create]
  before_action :authenticate_user!
  
  def index
    @questions = current_user.questions.paginate page: params[:page]
  end

  def new
    @question = Question.new
    @question.options.build
  end

  def create
    @question = Question.new question_params
    @question.user_id = current_user.id
    if @question.save
      flash[:success] = t "question.notice.create_success"
      redirect_to questions_path
    else
      render "new"
    end
  end

  private
  def load_subjects
    @subjects = Subject.all
  end

  def question_params
    params.require(:question).permit :content, :subject_id, :question_type, 
     options_attributes: [:id, :content, :is_correct]
  end
end