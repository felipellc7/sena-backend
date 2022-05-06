class Api::V1::PatientsController < ApplicationController
  before_action :authenticate_user_by_token
  before_action :can_to_do_admin_actions
  before_action :set_patient, only: [:show, :update, :destroy]

  def index
    @patients = Patient.all
    render json: @patients, status: 200
  end

  def show
    if @patient
      render json: @patient, status: 200
    else
      render json: {error: "Patient not found"}, status: 404
    end
  end

  def create
    @patient = Patient.new(patient_params)
    if @patient.save
      render json: @patient, status: 201
    else
      render json: {error: @patient.errors.full_messages.join(', ')}, status: 400
    end
  end

  def update
    if @patient.update(patient_params)
      render json: @patient, status: 200
    else
      render json: {error: @patient.errors.full_messages.join(', ')}, status: 400
    end
  end

  def destroy
    if @patient.destroy
      render json: {message: "Patient deleted"}, status: 200
    else
      render json: {error: @patient.errors.full_messages.join(', ')}, status: 400
    end
  end

  private
  def patient_params
    params.require(:patient).permit(
      :first_name,
      :last_name,
      :dni,
      :email,
      :password,
      :gender,
      :phone,
      :role,
      :active
    )
  end

  def set_patient
    @patient = Patient.find_by_dni(params[:dni])
  end
end
