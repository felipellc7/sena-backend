# == Schema Information
#
# Table name: appointments
#
#  id           :bigint           not null, primary key
#  observations :text
#  status       :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  doctors_id   :bigint           not null
#  patients_id  :bigint           not null
#  schedules_id :bigint           not null
#
# Indexes
#
#  index_appointments_on_doctors_id    (doctors_id)
#  index_appointments_on_patients_id   (patients_id)
#  index_appointments_on_schedules_id  (schedules_id)
#
# Foreign Keys
#
#  fk_rails_...  (doctors_id => doctors.id)
#  fk_rails_...  (patients_id => patients.id)
#  fk_rails_...  (schedules_id => schedules.id)
#
class Appointment < ApplicationRecord
  belongs_to :schedules
  belongs_to :patients
  belongs_to :doctors
end
