class AddReccomendsToTrips < ActiveRecord::Migration
  def change
    add_column :trips, :reccomends, :integer, :default => 0
  end
end
