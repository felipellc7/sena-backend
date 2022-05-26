class Api::V1::HelpersController < ApplicationController
  before_action :authenticate_user_by_token
  before_action :can_to_do_admin_actions

  def counter_entities
    entities = {
      doctors: Doctor.count,
      patients: Patient.count,
      specialties: Specialty.count,
      consulting_rooms: ConsultingRoom.count,
      schedules: Schedule.count,
      appointments: Appointment.count
    }
    render json: entities, status: 200
  end
end