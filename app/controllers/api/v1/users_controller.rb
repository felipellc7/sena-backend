class Api::V1::UsersController < ApplicationController
  before_action :authenticate_user_by_token
  def index
    @users = User.all
    render json: @users, status: 200
  end
end
