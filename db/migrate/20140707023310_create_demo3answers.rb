class CreateDemo3answers < ActiveRecord::Migration
  def change
    create_table :demo3answers do |t|
      t.integer :atype
      t.text :picture
      t.text :text
      t.text :audio

      t.boolean :isright
      t.timestamps
    end
  end
end
