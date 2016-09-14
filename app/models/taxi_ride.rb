class TaxiRide < ApplicationRecord
  belongs_to :taxi_provider

  validates :start_address, presence: true
  validates :destination_address, presence: true
  validates :fare, presence: true, numericality: {
    greater_than: 0
  }
  validates :taxi_provider_id, presence: true
  validates :taxi_provider, presence: true
  validates :distance, presence: true, numericality: {
    only_integer: true, greater_than: 0
  }
end
