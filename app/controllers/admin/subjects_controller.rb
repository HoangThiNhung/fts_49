class Admin::SubjectsController < Admin::BaseController
  def index
    @subjects = @subjects.page(params[:page]).per 10
  end

  def new
  end

  def create
    if @subject.save
      flash[:success] = t "flash.subject_success"
      redirect_to admin_subjects_path
    else
      flash[:danger] = t "flash.subject_failed"
      render :new
    end
  end

  private
  def subject_params
    params.require(:subject).permit :name
  end
end
