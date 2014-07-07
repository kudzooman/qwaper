class CreateCatagories < ActiveRecord::Migration
  def change
    create_table :catagories do |t|
      t.string :title
      t.references :post, index: true

      t.timestamps
    end
  end
end
