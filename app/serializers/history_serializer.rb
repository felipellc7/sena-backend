# == Schema Information
#
# Table name: histories
#
#  id             :bigint           not null, primary key
#  diagnosis      :text
#  treatment      :text
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  appointment_id :bigint           not null
#  doctor_id      :bigint           not null
#  patient_id     :bigint           not null
#
# Indexes
#
#  index_histories_on_appointment_id  (appointment_id)
#  index_histories_on_doctor_id       (doctor_id)
#  index_histories_on_patient_id      (patient_id)
#
# Foreign Keys
#
#  fk_rails_...  (appointment_id => appointments.id)
#  fk_rails_...  (doctor_id => doctors.id)
#  fk_rails_...  (patient_id => patients.id)
#
class HistorySerializer < ActiveModel::Serializer
  attributes :id, :diagnosis, :treatment, :appointment_id, :doctor_id, :patient_id
end
