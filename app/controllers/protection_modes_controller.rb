class ProtectionModesController < ApplicationController
  # skip_before_action :verify_authenticity_token

  def create
    response = HTTParty.post(Settings.watchbug_api+"/"+current_user.watchbug_id+"/request", body: {type: 'protection_mode'}.to_json, headers: {'Content-Type': 'application/json'})
    if response.code == 201
      flash[:notice] = 'Request sent'
    else
      flash[:alert] = 'Something went wrong'
    end
    redirect_to :root
  end
end