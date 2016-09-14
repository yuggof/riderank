require 'rails_helper'

RSpec.describe TaxiProvider do
  it 'has a valid factory' do
    expect(FactoryGirl.create(:taxi_provider)).to be_valid
  end
end
