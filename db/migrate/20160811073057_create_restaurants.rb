class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.integer :res_id
      t.integer :diners

      t.timestamps null: false
    end
  end
end
