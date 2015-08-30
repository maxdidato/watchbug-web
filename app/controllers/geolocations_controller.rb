class GeolocationsController < ApplicationController
  before_action :authenticate_user!

  def show
    response = HTTParty.get("#{Settings.watchbug_api}/geolocations/#{current_user[:watchbug_id]}").body
    parsed = JSON.parse(response)
    @link ="http://maps.google.com/maps?q=#{parsed['lat']},#{parsed['long']}&z=16&output=embed"
    @battery = parsed['battery']
  end
end
