class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(email: user_params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      render json: UsersSerializer.new(user)
    else
      render json: "Invalid Credentials", status: 401
    end
  end

  private

  def user_params
    params.permit(:email, :password)
  end
end