class AddCategoryIdToBicycles < ActiveRecord::Migration[5.2]
  def change
    add_column :bicycles, :category_id, :integer
  end
end
