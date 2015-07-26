class GeolocationsController < ApplicationController
  def show
      response = HTTParty.get('http://watchbug-api.herokuapp.com/geolocations/100').body
      parsed = JSON.parse(response)
      redirect_to("http://maps.google.com/maps?q=#{parsed['lat']},#{parsed['long']}&z19=")
  end
end
