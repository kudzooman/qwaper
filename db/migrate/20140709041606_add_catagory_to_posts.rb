class AddCatagoryToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :catagory_id, :integer
    add_index :posts, :catagory_id
  end
end
