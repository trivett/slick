class Api::V1::UsersController < ApplicationController
  respond_to :json
  def index
    @users = User.all
    render json: @users
  end
  def show
    @user = User.find(params[:id])
    render json: @user
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: 201, location: [:api, @user]
    else
      render json: { errors: @user.errors }, status: 422
    end
  end

  private
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :name)
    end
end
