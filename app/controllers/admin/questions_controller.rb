class Admin::QuestionsController < Admin::BaseController
  before_action :load_subjects, except: [:index, :destroy]
  
  def index
    @q = Question.ransack params[:q]
    option = params[:option].nil? ? Settings.questions.filter.all : params[:option]
    @questions = @q.result.includes(:subject).send(option).page(params[:page])
      .per Settings.questions.paginate
  end
  
  def show
    @options = @question.options
  end

  def new
    @question.options.build
  end

  def create
    @question.user_id = current_user.id
    @question.status = Question.statuses[:accepted]
    if @question.save
      flash[:success] = t "question.notice.create_success"
      redirect_to admin_question_path @question
    else
      render :new
    end
  end

  def update
    if @question.update_attributes question_params
      redirect_to admin_question_path @question
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    flash[:success] = t "question.notice.delete_success"
    redirect_to admin_questions_path
  end

  private
  def load_subjects
    @subjects = Subject.all
  end

  def question_params
    params.require(:question).permit :content, :subject_id, :question_type,
     :status, options_attributes: [:id, :content, :is_correct]
  end
end