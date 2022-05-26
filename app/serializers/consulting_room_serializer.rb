class ConsultingRoomSerializer < ActiveModel::Serializer
  attributes :id, :loc_address, :loc_city, :loc_commune, :loc_country, :loc_description, :loc_region, :name, :specialty_id, :specialty
end
