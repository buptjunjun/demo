class ChangeTypeToQtype < ActiveRecord::Migration
  def up
    #remove_column :question1s, :type
    #add_column :question1s, :qtype, :integer
  end

  def down
  end
end
