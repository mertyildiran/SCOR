class RemoveCategoryFromProducts < ActiveRecord::Migration
  def change
	remove_column :products, :category, :string
	remove_column :products, :subcategory, :string
  end
end
