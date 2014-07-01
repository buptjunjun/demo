class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :question_id
      t.boolean :isright
      t.integer :contenttype
      t.text :text
      t.text :voice
      t.text :video
      t.text :gif

      t.timestamps
    end
  end
end
