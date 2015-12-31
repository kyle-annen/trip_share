class AddCostToTrip < ActiveRecord::Migration
  def change
    add_column :trips, :cost, :decimal, :precision => 8, :scale => 2, :default => 0
  end
end
