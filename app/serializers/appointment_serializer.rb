# == Schema Information
#
# Table name: appointments
#
#  id           :bigint           not null, primary key
#  observations :text
#  status       :integer          default("reserved")
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  doctor_id    :bigint           not null
#  patient_id   :bigint           not null
#  schedule_id  :bigint           not null
#
# Indexes
#
#  index_appointments_on_doctor_id    (doctor_id)
#  index_appointments_on_patient_id   (patient_id)
#  index_appointments_on_schedule_id  (schedule_id)
#
# Foreign Keys
#
#  fk_rails_...  (doctor_id => doctors.id)
#  fk_rails_...  (patient_id => patients.id)
#  fk_rails_...  (schedule_id => schedules.id)
#
class AppointmentSerializer < ActiveModel::Serializer
  attributes :id, :observations, :status, :created_at, :updated_at, :doctor_id, :patient_id, :schedule_id
end
