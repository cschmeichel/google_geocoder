class AddressGeocoder
  class << self
    attr_accessor :google_maps_api_key

    GOOGLE_MAPS_URL = 'https://maps.googleapis.com/maps/api/geocode/json?address='

    def geocodeAddress(address)
      return 'Error: Address is Empty' unless address.present?

      request_url = GOOGLE_MAPS_URL + URI.encode(address) + "&key=#{google_maps_api_key}"
      response = HTTParty.get(request_url).parsed_response
      return response['error_message'] if response['error_message'].present?
      return 'No results for the given address' if response['results'].empty?

      address = response['results'].first['formatted_address']
      location = response['results'].first['geometry']['location']
      lat = location['lat']
      lng = location['lng']

      return nil, address, lat, lng
    end
  end
end
