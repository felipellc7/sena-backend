# == Schema Information
#
# Table name: consulting_rooms
#
#  id              :bigint           not null, primary key
#  loc_address     :string
#  loc_city        :string
#  loc_commune     :string
#  loc_country     :string
#  loc_description :string
#  loc_region      :string
#  name            :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  specialty_id    :bigint           not null
#
# Indexes
#
#  index_consulting_rooms_on_specialty_id  (specialty_id)
#
# Foreign Keys
#
#  fk_rails_...  (specialty_id => specialties.id)
#
class ConsultingRoomSerializer < ActiveModel::Serializer
  attributes :id, :loc_address, :loc_city, :loc_commune, :loc_country, :loc_description, :loc_region, :name, :specialty_id, :specialty
end
