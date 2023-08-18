class AddUserIdToBicycles < ActiveRecord::Migration[5.2]
  def change
    add_column :bicycles, :user_id, :integer
  end
end
