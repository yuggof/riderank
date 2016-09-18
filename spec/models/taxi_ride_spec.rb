require 'rails_helper'

RSpec.describe TaxiRide do
  it 'has a valid factory' do
    expect(FactoryGirl.build(:taxi_ride)).to be_valid
  end

  describe 'validation' do
    context 'when distance between start address and destination address can be calculated' do
      it 'sets distance' do
        u = FactoryGirl.create(:user)
        tr = TaxiRide.new(
          user: u, start_address: 'a', destination_address: 'b',
          fare: 1, taxi_provider: FactoryGirl.create(:taxi_provider)
        )

        expect(tr.valid?).to be true
        expect(tr.distance).to eql 15
      end
    end

    context 'when distance between start address and destination address cannot be calculated' do
      it 'sets errors on start_address and destination_address' do
        tr = TaxiRide.new(
          start_address: 'a', destination_address: 'b',
          fare: 1, taxi_provider: FactoryGirl.create(:taxi_provider)
        )

        GoogleMapsDistanceMatrixAPI.client.distance_between_return_value = nil

        expect(tr.valid?).to be false
        expect(tr.errors[:start_address].size).to eql 1
        expect(tr.errors[:destination_address].size).to eql 1
        expect(tr.distance).to be nil
      end
    end
  end

  describe '.grouped_by_day' do
    it 'returns scope with grouped taxi rides' do
      GoogleMapsDistanceMatrixAPI.client.distance_between_return_value = 1

      n = Time.zone.now

      10.times { |i| FactoryGirl.create(:taxi_ride, created_at: n - i.day) }
      FactoryGirl.create_list(:taxi_ride, 3, created_at: n - 1.day)

      expect(TaxiRide.grouped_by_day(1).count).to eql 8
      expect(TaxiRide.grouped_by_day(2).count).to eql 5
    end
  end
end
