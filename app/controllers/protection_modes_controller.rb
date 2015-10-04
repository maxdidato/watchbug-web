class ProtectionModesController < ApplicationController
  before_action :authenticate_user!

  def update
    response = HTTParty.put(Settings.watchbug_api+"/"+current_user.watchbug_id+"/request", body: {type: 'protection_mode',action:'on'}.to_json, headers: {'Content-Type': 'application/json'})
    if response.code == 204
      flash[:notice] = 'Request sent'
    else
      flash[:alert] = 'Something went wrong'
    end
    redirect_to :root
  end
end