class AddDatetimeToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :datetime, :datetime
  end
end
