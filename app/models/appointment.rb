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
  validates :schedule_id, uniqueness: true
  validate :check_schedule_availability, if: :check_valid_doctor_consulting_room

  # Datatypes
  enum status: [:reserved, :confirmed, :in_progress, :canceled, :closed]

  # Method calls
  after_create :update_schedule_availability

  # Scopes
  scope :filter_by_schedule_code, -> (schedule_code) { joins(:schedule).where(schedules: { code: schedule_code }) }
  scope :filter_by_date, -> (date) { joins(:schedule).where(schedules: { date: date }) }
  scope :filter_by_doctor_dni, -> (doctor_dni) { joins(:doctor).where(doctors: { dni: doctor_dni }) }
  scope :filter_by_patient_dni, -> (patient_dni) { joins(:patient).where(patients: { dni: patient_dni }) }
  scope :filter_by_status, -> (status) { where(status: status) }

  private
  def check_schedule_availability
    if !self.schedule.present?
      errors.add(:schedule, "No existe una agenda con ese código")
    else
      if self.schedule.available == false
        errors.add(:schedule, "No se puede reservar una agenda ya reservada")
      end
    end
  end

  def check_valid_doctor_consulting_room
    if !self.doctor.present? || !self.schedule.present?
      errors.add(:doctor, "No existe un doctor o una agenda con ese código")
    else
      if self.doctor.specialty != self.schedule.consulting_room.specialty
        errors.add(:doctor, "El doctor no puede atender a esa cita")
      end
    end
    true
  end

  def update_schedule_availability
    self.schedule.available = false
    self.schedule.save(validate: false)
  end
end
