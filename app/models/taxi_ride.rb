class TaxiRide < ApplicationRecord
  belongs_to :user
  belongs_to :taxi_provider

  validates :user_id, presence: true
  validates :user, presence: true
  validates :start_address, presence: true
  validates :destination_address, presence: true
  validates :fare, presence: true, numericality: {
    greater_than: 0
  }
  validates :taxi_provider_id, presence: true
  validates :taxi_provider, presence: true
  validate :distance_can_be_calculated

  scope :from_current_month, -> do
    n = Time.zone.now
    where(created_at: n.beginning_of_month..n.end_of_month)
  end

  private

  def distance_can_be_calculated
    d = GoogleMapsDistanceMatrixAPI.client.distance_between(
      start_address,
      destination_address
    )

    if d
      self.distance = (d / 1000.0).round
    else
      errors[:start_address] << 'cannot calculate distance with provided address'
      errors[:destination_address] << 'cannot calculate distance with provided address'
    end
  end
end
