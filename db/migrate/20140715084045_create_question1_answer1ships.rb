class CreateQuestion1Answer1ships < ActiveRecord::Migration
  def change
    create_table :question1_answer1ships do |t|
      t.integer :question1_id
      t.integer :answer1_id

      t.timestamps
    end
  end
end
