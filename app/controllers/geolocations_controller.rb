class GeolocationsController < ApplicationController
  before_action :authenticate_user!

  def show
    last_known=current_user.geolocation
    @link ="https://maps.google.com/maps?q=#{last_known[:lat]},#{last_known[:long]}&z=16&output=embed"
    @battery = last_known[:battery]
  end
end
