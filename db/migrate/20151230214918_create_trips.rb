class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :name
      t.decimal :cost, :precision => 8, :scale => 2 
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
