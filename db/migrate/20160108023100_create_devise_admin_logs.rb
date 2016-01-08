class CreateDeviseAdminLogs < ActiveRecord::Migration
  def change
    create_table :devise_admin_logs do |t|
      t.integer  "user_id",    null: false
      t.string   "action"
      t.timestamps null: false
    end
  end
end
