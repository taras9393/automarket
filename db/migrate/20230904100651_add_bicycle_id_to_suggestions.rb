class AddBicycleIdToSuggestions < ActiveRecord::Migration[5.2]
  def change
    add_column :suggestions, :bicycle_id, :integer
  end
end
