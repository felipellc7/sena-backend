class Api::V1::SpecialtiesController < ApplicationController
  before_action :authenticate_user_by_token
  before_action :can_to_do_admin_actions
  before_action :set_specialty, only: [:show, :update, :destroy]

  def index
    @specialties = Specialty.all
    render json: @specialties, status: 200
  end

  def show
    if @specialty
      render json: @specialty, status: 200
    else
      render json: {error: "Specialty not found"}, status: 404
    end
  end

  def create
    @specialty = Specialty.new(specialty_params)
    if @specialty.save
      render json: @specialty, status: 201
    else
      render json: {error: @specialty.errors.full_messages.join(', ')}, status: 400
    end
  end

  def update
    if @specialty.update(specialty_params)
      render json: @specialty, status: 200
    else
      render json: {error: @specialty.errors.full_messages.join(', ')}, status: 400
    end
  end

  def destroy
    if @specialty.destroy
      render json: {message: "Specialty deleted"}, status: 200
    else
      render json: {error: @specialty.errors.full_messages.join(', ')}, status: 400
    end
  end

  private
  def specialty_params
    params.require(:specialty).permit(
      :name,
    )
  end

  def set_specialty
    @specialty = Specialty.find_by_id(params[:id])
  end
end
