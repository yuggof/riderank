module GoogleMapsDistanceMatrixAPI
  class TestClient
    attr_accessor :distance_between_return_value

    def initialize
      self.distance_between_return_value = 15063
    end

    def distance_between(origin, destination)
      distance_between_return_value
    end
  end
end
