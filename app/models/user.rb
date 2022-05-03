# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  active          :boolean
#  dni             :string
#  email           :string
#  first_name      :string
#  full_name       :string
#  gender          :integer
#  last_name       :string
#  password_digest :string
#  phone           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
  # Validations
  validates :first_name, :last_name, :dni, :gender, :email, :phone, presence: true
  validates :dni, uniqueness: true

  # Datatypes
  enum gender: [:male, :female]

  # Method calls
  before_save :set_full_name
  before_create :set_password

  def set_full_name
    self.full_name = "#{self.first_name} #{self.last_name}"
  end

  def set_password
    self.password_digest = self.dni
  end
end
