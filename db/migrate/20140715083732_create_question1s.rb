class CreateQuestion1s < ActiveRecord::Migration
  def change
    create_table :question1s do |t|
      t.string :text1
      t.string :text2
      t.string :text3
      t.string :audio
      t.string :image
      t.integer :answer

      t.timestamps
    end
  end
end
