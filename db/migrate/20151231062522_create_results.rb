class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.references :exam
      t.references :question
      t.references :option
      t.integer :spent_time
      t.timestamps null: false
    end
  end
end
