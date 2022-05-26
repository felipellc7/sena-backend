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

  # Method calls
  before_save :set_downcase_fields

  # Scopes
  scope :filter_by_name, -> (name) { where("name like ?", "#{name.downcase}%")}

  private
  def set_downcase_fields
    self.name.downcase!
  end
end
