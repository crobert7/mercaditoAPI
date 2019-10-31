class Api::V1::UsersController < ApplicationController

  #Get /users/v1

  def show

    render json: User.find(params[:id])

  end

end
