class AlarmsController < ApplicationController
skip_before_action :verify_authenticity_token

  def create
    WebsocketRails[:alarm].trigger params[:watchbug_id], 'Your vehicle is being stolen'
    head 201
  end
end