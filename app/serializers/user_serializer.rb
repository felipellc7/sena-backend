class UserSerializer < ActiveModel::Serializer
  attributes :id, :active, :dni, :email, :first_name, :full_name, :gender, :last_name, :phone, :role
end
