class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.integer :trip_id
      t.string :city
      t.string :state_province
      t.string :country
      t.decimal :lat, :precision=> 10, :scale => 6
      t.decimal :long, :precision=> 10, :scale => 6
      t.datetime :arrival_date_time
      t.string :time_zone_id
      t.string :time_zone_name
      t.integer :dst_offset
      t.integer :raw_offset

      t.timestamps null: false
    end
  end
end
