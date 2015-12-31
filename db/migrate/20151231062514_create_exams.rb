class CreateExams < ActiveRecord::Migration
  def change
    create_table :exams do |t|
      t.references :subject
      t.references :user
      t.integer :duration
      t.integer :number_question
      t.string :status
      t.timestamps null: false
    end
  end
end
