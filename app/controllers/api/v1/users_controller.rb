class Api::V1::UsersController < ApplicationController
  before_action :authenticate_user_by_token
  before_action :can_to_do_admin_actions
  before_action :set_user, only: [:show, :update, :destroy]

  def index
    @users = User.all
    render json: @users, status: 200
  end

  def show
    if @user
      render json: @user, status: 200
    else
      render json: {error: "User not found"}, status: 404
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: 201
    else
      render json: {error: @user.errors.full_messages.join(', ')}, status: 400
    end
  end

  def update
    if @user.update(user_params)
      render json: @user, status: 200
    else
      render json: {error: @user.errors.full_messages.join(', ')}, status: 400
    end
  end

  def destroy
    if @user.destroy
      render json: {message: "User deleted"}, status: 200
    else
      render json: {error: @user.errors.full_messages.join(', ')}, status: 400
    end
  end

  private
  def user_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :dni,
      :email,
      :password,
      :gender,
      :phone,
      :role,
      :active,
    )
  end

  def set_user
    @user = User.find_by_dni(params[:dni])
  end
end
