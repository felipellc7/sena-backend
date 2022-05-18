class Api::V1::DoctorsController < ApplicationController
  before_action :authenticate_user_by_token
  before_action :can_to_do_admin_actions
  before_action :set_doctor, only: [:show, :update, :destroy]

  def index
    req_paginated = Doctor.page(params[:from]).per(params[:size])
    @doctors = req_paginated
    filtering_params(params[:filters]).each do |key, value|
      @doctors = @doctors.public_send("filter_by_#{key}", value) if value.present?
    end
    render json: format_pagination_response(@doctors, params), status: 200
  end

  def show
    if @doctor
      render json: @doctor, status: 200
    else
      render json: {error: "Doctor not found"}, status: 404
    end
  end

  def create
    @doctor = Doctor.new(doctor_params)
    if @doctor.save
      render json: @doctor, status: 201
    else
      render json: {error: @doctor.errors.full_messages.join(', ')}, status: 400
    end
  end

  def update
    if @doctor.update(doctor_params)
      render json: @doctor, status: 200
    else
      render json: {error: @doctor.errors.full_messages.join(', ')}, status: 400
    end
  end

  def destroy
    if @doctor.destroy
      render json: {message: "Doctor deleted"}, status: 200
    else
      render json: {error: @doctor.errors.full_messages.join(', ')}, status: 400
    end
  end

  private
  def doctor_params
    params.require(:doctor).permit(
      :first_name,
      :last_name,
      :dni,
      :email,
      :password,
      :gender,
      :phone,
      :role,
      :active,
      :specialty_id
    )
  end

  def set_doctor
    @doctor = Doctor.find_by_dni(params[:dni])
  end
end
