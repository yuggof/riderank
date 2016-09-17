module GoogleMapsDistanceMatrixAPI
  class << self
    def client
      @client ||= create_client
    end

    private

    def create_client
      if Rails.env.test?
        GoogleMapsDistanceMatrixAPI::TestClient.new
      else
        GoogleMapsDistanceMatrixAPI::Client.new(
          ENV['GOOGLE_MAPS_DISTANCE_MATRIX_API_KEY']
        )
      end
    end
  end
end
