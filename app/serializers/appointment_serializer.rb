class AppointmentSerializer < ActiveModel::Serializer
  attributes :id, :observations, :status, :created_at, :updated_at, :doctor_id, :patient_id, :schedule_id
end
