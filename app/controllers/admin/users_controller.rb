class Admin::UsersController < Admin::BaseController

  def index
    @q = User.ransack params[:q]
    @users = @q.result.page(params[:page]).per Settings.users.paginate
  end
  
  def show
  end
end