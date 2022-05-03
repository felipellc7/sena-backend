# == Schema Information
#
# Table name: schedules
#
#  id                  :bigint           not null, primary key
#  available           :boolean
#  date                :date
#  time                :time
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  consulting_rooms_id :bigint           not null
#
# Indexes
#
#  index_schedules_on_consulting_rooms_id  (consulting_rooms_id)
#
# Foreign Keys
#
#  fk_rails_...  (consulting_rooms_id => consulting_rooms.id)
#
class Schedule < ApplicationRecord
  belongs_to :consulting_rooms
end
