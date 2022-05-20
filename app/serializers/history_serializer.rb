class HistorySerializer < ActiveModel::Serializer
  attributes :id, :diagnosis, :treatment, :appointment_id, :doctor_id, :patient_id
end
