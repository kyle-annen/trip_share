class RemoveCostFromTrips < ActiveRecord::Migration
  def up 
    remove_column :trips, :cost
  end
  
  def down
    add_column :trips, :cost
  end
end
