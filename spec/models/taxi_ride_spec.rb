require 'rails_helper'

RSpec.describe TaxiRide do
  it 'has a valid factory' do
    expect(FactoryGirl.build(:taxi_ride)).to be_valid
  end
end
