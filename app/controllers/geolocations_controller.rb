class GeolocationsController < ApplicationController
  def show
    response = HTTParty.get('http://localhost:3000/geolocations/100').body
    parsed = JSON.parse(response)
    @link ="http://maps.google.com/maps?q=#{parsed['lat']},#{parsed['long']}&z=16&output=embed"
    @battery = parsed['battery']
    # redirect_to("http://maps.google.com/maps?q=#{parsed['lat']},#{parsed['long']}&z19=")
  end
end
