class RemoveCategoryFromBicycles < ActiveRecord::Migration[5.2]
  def change
    remove_column :bicycles, :category, :string
  end
end
