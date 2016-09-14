class CreateTaxiRides < ActiveRecord::Migration[5.0]
  def change
    create_table :taxi_rides do |t|
      t.string :start_address, null: false
      t.string :destination_address, null: false

      t.decimal :fare, precision: 5, scale: 2, null: false

      t.integer :taxi_provider_id, null: false

      t.integer :distance, null: false

      t.timestamps null: false
    end
  end
end
