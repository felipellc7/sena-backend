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
class History < ApplicationRecord
  # Asociations
  belongs_to :appointment
  belongs_to :patient
  belongs_to :doctor

  # Validations
  validates :diagnosis, :treatment, presence: true
end
