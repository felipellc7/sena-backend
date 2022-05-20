# == Schema Information
#
# Table name: patients
#
#  id              :bigint           not null, primary key
#  active          :boolean          default(TRUE)
#  dni             :string
#  email           :string
#  first_name      :string
#  full_name       :string
#  gender          :integer
#  last_name       :string
#  password_digest :string
#  phone           :string
#  role            :string           default("patient")
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class Patient < ApplicationRecord
  has_secure_password
  # Asociations
  has_many :appointments

  # Validations
  validates :first_name, :last_name, :dni, :gender, :email, :phone, presence: true
  validates :dni, uniqueness: true

  # Datatypes
  enum gender: [:male, :female]

  # Method calls
  before_save :set_full_name
  before_save :set_downcase_fields

  # Scopes
  scope :filter_by_gender, -> (gender) { where gender: gender }
  scope :filter_by_dni, -> (dni) { where dni: dni}
  scope :filter_by_full_name, -> (full_name) { where("full_name like ?", "#{full_name.downcase}%")}

  private
  def set_full_name
    self.full_name = "#{self.first_name} #{self.last_name}"
  end

  def set_downcase_fields
    self.first_name.downcase!
    self.last_name.downcase!
    self.full_name.downcase!
    self.email.downcase!
  end
end
