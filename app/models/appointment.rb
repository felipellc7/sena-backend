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
class Appointment < ApplicationRecord
  # Asociations
  belongs_to :schedule
  belongs_to :patient
  belongs_to :doctor

  # Validations
  validates :observations, :status, presence: true

  # Datatypes
  enum status: [:reserved, :confirmed, :in_progress, :canceled, :closed]

  # Methods calls
  before_create :check_schedule_availability
  before_save :check_valid_doctor_consulting_room

  def check_valid_doctor_consulting_room
    if self.doctor.specialty != self.schedule.consulting_room.specialty
      errors.add(:doctor, "is not valid for this appointment")
    end
  end

  def check_schedule_availability
    if self.schedule.available == false
      errors.add(:schedule, "is not available")
    else
      self.schedule.update(available: false)
    end
  end
end
