# == Schema Information
#
# Table name: schedules
#
#  id                 :bigint           not null, primary key
#  available          :boolean          default(TRUE)
#  code               :string
#  date               :date
#  time               :time
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  consulting_room_id :bigint           not null
#
# Indexes
#
#  index_schedules_on_consulting_room_id  (consulting_room_id)
#
# Foreign Keys
#
#  fk_rails_...  (consulting_room_id => consulting_rooms.id)
#
class Schedule < ApplicationRecord
  # Asociations
  belongs_to :consulting_room
  has_many :appointments

  # Validations
  validates :date, :time, presence: true
  validate :assign_schedule_code

  # Method calls
  
  # Scopes
  scope :filter_by_code, -> (code) { where code: code }
  scope :filter_by_available, -> (state) { where(available: state) }
  scope :filter_by_date, -> (date) { where(date: date) }
  scope :filter_by_time, -> (time) { where(time: time) }
  scope :filter_by_consulting_room_id, -> (consulting_room_id) { where(consulting_room_id: consulting_room_id) }

  private
  def assign_schedule_code
    self.code = "AG00#{self.consulting_room_id}F#{self.date.strftime("%d%m%Y")}H#{self.time.strftime("%H%M")}"
    if self.class.exists?(code: self.code)
      errors.add(:code, "Ya existe una agenda con estos datos")
    end
  end
end
