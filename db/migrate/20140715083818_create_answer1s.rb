class CreateAnswer1s < ActiveRecord::Migration
  def change
    create_table :answer1s do |t|
      t.string :text1
      t.string :text2
      t.string :text3
      t.string :audio
      t.string :image

      t.timestamps
    end
  end
end
