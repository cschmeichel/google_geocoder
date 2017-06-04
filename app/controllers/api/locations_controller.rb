class Api::LocationsController < ApplicationController

  # GET /api/locations.json
  def index
    # Add pagination
    @locations = Location.all
  end

  # POST /api/locations.json
  def create
    error_message, address, lat, lng  = AddressGeocoder.geocodeAddress(location_params[:address])

    render json: { errors: error_message }, status: :unprocessable_entity and return if error_message

    location = Location.new(address: address, lat: lat, lng: lng)
    if location.save
      render json: location, status: :ok, location: api_locations_url
    else
      render json: { errors: location.errors.full_messages }, status: :unprocessable_entity
    end
  end

private

  # Never trust parameters from internet
  def location_params
    params.require(:location).permit(:address)
  end
end
