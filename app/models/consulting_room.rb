# == Schema Information
#
# Table name: consulting_rooms
#
#  id              :bigint           not null, primary key
#  loc_city        :string
#  loc_commune     :string
#  loc_country     :string
#  loc_description :string
#  loc_nomeclature :string
#  loc_region      :string
#  name            :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  specialties_id  :bigint           not null
#
# Indexes
#
#  index_consulting_rooms_on_specialties_id  (specialties_id)
#
# Foreign Keys
#
#  fk_rails_...  (specialties_id => specialties.id)
#
class ConsultingRoom < ApplicationRecord
  belongs_to :specialties
end
