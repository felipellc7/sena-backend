class Api::V1::AppointmentsController < ApplicationController
  before_action :authenticate_user_by_token
  before_action :can_to_do_admin_actions
  before_action :set_appointment, only: [:show, :update, :destroy]

  def index
    req_paginated = Appointment.page(params[:from]).per(params[:size])
    @appointments = req_paginated
    filtering_params(params[:filters]).each do |key, value|
      @appointments = @appointments.public_send("filter_by_#{key}", value) if value.present?
    end
    render json: format_pagination_response(@appointments, params), status: 200
  end

  def show
    if @appointment
      render json: @appointment, status: 200
    else
      render json: {error: "Appointment not found"}, status: 404
    end
  end

  def create
    @appointment = Appointment.new()
    @appointment.schedule = Schedule.find_by_code(appointment_params[:schedule_code])
    @appointment.patient = Patient.find_by_dni(appointment_params[:patient_dni])
    @appointment.doctor = Doctor.find_by_dni(appointment_params[:doctor_dni])
    @appointment.observations = appointment_params[:observations]
    if @appointment.save
      render json: @appointment, status: 201
    else
      render json: {error: @appointment.errors.full_messages.join(', ')}, status: 400
    end
  end

  def update
    @appointment.schedule = Schedule.find_by_code(appointment_params[:schedule_code])
    @appointment.patient = Patient.find_by_dni(appointment_params[:patient_dni])
    @appointment.doctor = Doctor.find_by_dni(appointment_params[:doctor_dni])
    @appointment.observations = appointment_params[:observations]
    if @appointment.save
      render json: @appointment, status: 200
    else
      render json: {error: @appointment.errors.full_messages.join(', ')}, status: 400
    end
  end

  def destroy
    if @appointment.destroy
      render json: {message: "Appointment deleted"}, status: 200
    else
      render json: {error: @appointment.errors.full_messages.join(', ')}, status: 400
    end
  end

  private
  def appointment_params
    params.require(:appointment).permit(
      :status,
      :observations,
      :doctor_dni,
      :patient_dni,
      :schedule_code,
    )
  end

  def set_appointment
    @appointment = Appointment.find_by_id(params[:id])
  end
end
