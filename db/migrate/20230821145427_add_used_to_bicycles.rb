class AddUsedToBicycles < ActiveRecord::Migration[5.2]
  def change
    add_column :bicycles, :used, :boolean
  end
end
