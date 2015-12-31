class AddBlurbToTrip < ActiveRecord::Migration
  def change
    add_column :trips, :blurb, :text
  end
end
