# == Schema Information
#
# Table name: schedules
#
#  id                 :bigint           not null, primary key
#  available          :boolean          default(TRUE)
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
end
