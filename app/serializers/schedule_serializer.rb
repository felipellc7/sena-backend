class ScheduleSerializer < ActiveModel::Serializer
  attributes :id, :available, :date, :time, :consulting_room
end
