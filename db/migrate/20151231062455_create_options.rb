class CreateOptions < ActiveRecord::Migration
  def change
    create_table :options do |t|     
      t.string :content
      t.boolean :is_correct
      t.references :question
      t.timestamps null: false
    end
  end
end
