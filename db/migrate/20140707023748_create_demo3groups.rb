class CreateDemo3groups < ActiveRecord::Migration
  def change
    create_table :demo3groups do |t|
      t.timestamps
    end
  end
end
