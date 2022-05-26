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
class ConsultingRoom < ApplicationRecord
  # Asociations
  belongs_to :specialty
  has_many :schedules

  # Validations
  validates :name, :loc_country, :loc_region, :loc_city, :loc_commune, :loc_address, presence: true

  # Method calls
  before_save :set_downcase_fields

  # Scopes
  scope :filter_by_specialty_id, -> (specialty_id) { where specialty_id: specialty_id }

  private
  def set_downcase_fields
    self.name.downcase!
    self.loc_country.downcase!
    self.loc_region.downcase!
    self.loc_city.downcase!
    self.loc_commune.downcase!
    self.loc_address.downcase!
  end
end
