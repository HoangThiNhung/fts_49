class QuestionsController < ApplicationController
  before_action :load_subjects, except: [:index, :destroy]
  before_action :authenticate_user!
  load_and_authorize_resource
  
  def index
    @questions = current_user.questions.page(params[:page]).per 5
  end

  def show
    @options = @question.options
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
      render :new
    end
  end

  def edit
  end

  def update
    if @question.update_attributes question_params
      redirect_to @question
    else
      render :edit
    end
  end

  def destroy
    Question.find(params[:id]).destroy
    flash[:success] = t "question.notice.delete_success"
    redirect_to questions_path
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