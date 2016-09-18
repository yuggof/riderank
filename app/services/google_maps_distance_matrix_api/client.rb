module GoogleMapsDistanceMatrixAPI
  class Client
    def initialize(api_key)
      @api_key = api_key
    end

    def distance_between(origin, destination)
      u = URI('https://maps.googleapis.com/maps/api/distancematrix/json')
      u.query = URI.encode_www_form(
        origins: origin,
        destinations: destination,
        key: @api_key
      )

      r = Net::HTTP.get_response(u)
      h = JSON.parse(r.body)

      if h['status'] == 'OK' && h['rows'][0]['elements'][0]['status'] == 'OK'
        h['rows'][0]['elements'][0]['distance']['value']
      end
    end
  end
end
