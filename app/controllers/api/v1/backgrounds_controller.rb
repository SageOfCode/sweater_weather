class Api::V1::BackgroundsController < ApplicationController
  def index
    image = ImageFacade.grab_image(params[:location])
    if image 
      render json: ImageSerializer.new(image)
    else 
      render body: "Invalid Query", status: 400
    end
  end
end 