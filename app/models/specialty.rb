# == Schema Information
#
# Table name: specialties
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Specialty < ApplicationRecord
  # Asociations
  has_many :doctors
  has_many :consulting_rooms

  # Validations
  validates :name, presence: true
end
