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
class ScheduleSerializer < ActiveModel::Serializer
  attributes :id, :available, :date, :time, :consulting_room_id, :consulting_room, :code
end
