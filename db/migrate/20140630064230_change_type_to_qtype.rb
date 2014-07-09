class ChangeTypeToQtype < ActiveRecord::Migration
  def up
    #remove_column :questions, :type
    #add_column :questions, :qtype, :integer
  end

  def down
  end
end
