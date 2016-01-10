class ApplicationController < ActionController::Base
  include PublicActivity::StoreController
  
  protect_from_forgery with: :exception
  rescue_from CanCan::AccessDenied do |exception|
    flash[:danger] = t "flash.access_denied"
    redirect_to root_url
  end

  private
  def after_sign_in_path_for resource
    if resource.admin
      DeviseAdminLog.log resource, t("admin.logs.log_in")
      admin_root_url
    else
      exams_path
    end
  end
end
