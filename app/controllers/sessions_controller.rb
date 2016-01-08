class SessionsController < Devise::SessionsController
  def destroy
    DeviseAdminLog.log current_user, t("admin.logs.log_out")
    super
  end
end
