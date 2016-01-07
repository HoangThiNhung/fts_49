class Admin::ExamsController < Admin::BaseController
  def index
    @exams = @exams.page(params[:page]).per 10
  end
end
