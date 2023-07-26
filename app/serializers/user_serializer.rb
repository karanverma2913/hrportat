class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :password, :role, :salary
end
