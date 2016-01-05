class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :content
      t.string :status, default: :waitting
      t.string :question_type
      t.references :user
      t.references :subject
      t.timestamps null: false
    end
  end
end
