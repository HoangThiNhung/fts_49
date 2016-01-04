class ChangeExamsTable < ActiveRecord::Migration
  def change
    remove_column :exams, :status
    add_column :exams, :time_start, :integer
    add_column :exams, :time_end, :integer
    add_column :exams, :status, :integer
  end
end
