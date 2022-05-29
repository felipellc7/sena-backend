# == Schema Information
#
# Table name: doctors
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
#  role            :string           default("doctor")
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  specialty_id    :bigint           not null
#
# Indexes
#
#  index_doctors_on_specialty_id  (specialty_id)
#
# Foreign Keys
#
#  fk_rails_...  (specialty_id => specialties.id)
#
class DoctorSerializer < ActiveModel::Serializer
  attributes :id, :active, :dni, :email, :first_name, :full_name, :gender, :last_name, :phone, :role, :specialty, :specialty_id
end
