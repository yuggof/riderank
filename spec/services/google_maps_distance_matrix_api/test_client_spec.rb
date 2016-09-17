require 'rails_helper'

RSpec.describe GoogleMapsDistanceMatrixAPI::TestClient do
  describe '#distance_between' do
    it 'returns distance_between_return_value' do
      tc = GoogleMapsDistanceMatrixAPI::TestClient.new
      tc.distance_between_return_value = 12345

      d = tc.distance_between(
        'Żelazna 82, Warszawa, Polska',
        'Lisi Jar 5, Warszawa, Polska'
      )

      expect(d).to eql 12345
    end
  end
end
