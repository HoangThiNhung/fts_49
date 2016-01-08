class Admin::DeviseAdminLogsController < Admin::BaseController
  def index
    @devise_admin_logs =@devise_admin_logs.page(params[:page]).per 10
  end
end
