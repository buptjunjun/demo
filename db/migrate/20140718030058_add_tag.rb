class AddTag < ActiveRecord::Migration

  def change
    add_column :question1s, :tag,:string
    add_column :answer1s  ,  :tag,:string
  end
end
