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
class PatientSerializer < ActiveModel::Serializer
  attributes :id, :active, :dni, :email, :first_name, :full_name, :gender, :last_name, :phone, :role
end
