class DeviseAdminLog < ActiveRecord::Base
  belongs_to :user

  default_scope {order created_at: :desc}

  def self.log resource, new_action
    if resource.admin
      DeviseAdminLog.create! user_id: resource.id, action: new_action
    end
  end
end
