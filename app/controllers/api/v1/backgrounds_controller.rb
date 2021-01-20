class Api::V1::BackgroundsController < ApplicationController
  def index
    if params[:location] != ""
      image = ImageFacade.grab_image(params[:location])
      render json: ImageSerializer.new(image)
    else 
      render body: "Invalid Query", status: 400
    end
  end
end 