class CreateDemo3questions < ActiveRecord::Migration
  def change
    create_table :demo3questions do |t|
      t.text :text1
      t.text :text2
      t.text :picture
      t.text :audio
      t.integer :qtype
      t.timestamps
    end
  end
end
