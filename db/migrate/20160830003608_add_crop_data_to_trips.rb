class AddCropDataToTrips < ActiveRecord::Migration
  def change
    add_column :trips, :crop_data, :string
  end
end
