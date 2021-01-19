class Api::V1::UsersController < ApplicationController
  def create
    if validate_password
      user = User.new(user_params)
      user.create_key
      if user.save
        render json: UsersSerializer.new(user)
      else 
        render body: "Invalid Credentials", status: 400 
      end 
    else
      render body: "Unauthorized, passwords do not match", status: 401 
    end
  end

  private

  def user_params
    params.permit(:email, :password)
  end

  def validate_password
    params[:password] == params[:password_confirmation]
  end
end