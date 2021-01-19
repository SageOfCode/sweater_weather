class Api::V1::MunchiesController < ApplicationController
  def index
    munchie_object = RestaurantFacade.create_munchie_obj(params[:start], params[:destination], params[:food])
    render json: MunchieSerializer.new(munchie_object)
  end
end 