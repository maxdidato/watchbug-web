class GeolocationsController < ApplicationController
  def show
      response = HTTParty.get('http://watchbug-api.herokuapp.com/geolocations/100').body
      parsed = JSON.parse(response)
      redirect_to("http://maps.google.com/maps?z=12&t=m&q=loc:#{parsed[:lat]}+#{parsed[:long]}")
  end
end
