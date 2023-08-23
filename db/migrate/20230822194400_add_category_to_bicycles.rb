class AddCategoryToBicycles < ActiveRecord::Migration[5.2]
  def change
    add_column :bicycles, :category, :string
  end
end
