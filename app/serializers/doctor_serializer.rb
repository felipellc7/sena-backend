class DoctorSerializer < ActiveModel::Serializer
  attributes :id, :active, :dni, :email, :first_name, :full_name, :gender, :last_name, :phone, :role, :specialty, :specialty_id
end
