class RemoveUsedFromBicycles < ActiveRecord::Migration[5.2]
  def change
    remove_column :bicycles, :used, :boolean
  end
end
