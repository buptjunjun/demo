class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :topic_id
      t.integer :qtype
      t.integer :contenttype
      t.text :text
      t.text :voice
      t.text :video
      t.text :gif

      t.timestamps
    end
  end
end
