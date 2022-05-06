class Api::V1::AppointmentsController < ApplicationController
  before_action :authenticate_user_by_token
  before_action :can_to_do_admin_actions
  before_action :set_appointment, only: [:show, :update, :destroy]

  def index
    @appointments = Appointment.all
    render json: @appointments, status: 200
  end

  def show
    if @appointment
      render json: @appointment, status: 200
    else
      render json: {error: "Appointment not found"}, status: 404
    end
  end

  def create
    @appointment = Appointment.new(appointment_params)
    if @appointment.save
      render json: @appointment, status: 201
    else
      render json: {error: @appointment.errors.full_messages.join(', ')}, status: 400
    end
  end

  def update
    if @appointment.update(appointment_params)
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
      :doctor_id,
      :patient_id,
      :schedule_id,
    )
  end

  def set_appointment
    @appointment = Appointment.find_by_id(params[:id])
  end
end
