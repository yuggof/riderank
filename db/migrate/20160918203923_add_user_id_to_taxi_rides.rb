class AddUserIdToTaxiRides < ActiveRecord::Migration[5.0]
  def change
    add_column :taxi_rides, :user_id, :integer, null: false, default: 1
    change_column_default :taxi_rides, :user_id, nil
  end
end
