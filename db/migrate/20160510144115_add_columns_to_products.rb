class AddColumnsToProducts < ActiveRecord::Migration
  def change
	add_column :products, :category_id, :string
  end
end
