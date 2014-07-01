class CreateUploadfiles < ActiveRecord::Migration
  def change
    create_table :uploadfiles do |t|

      t.timestamps
    end
  end
end
