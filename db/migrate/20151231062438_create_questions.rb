class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :content
      t.integer :status, default: Question.statuses[:waitting]
      t.integer :question_type
      t.references :user
      t.references :subject
      t.timestamps null: false
    end
  end
end
