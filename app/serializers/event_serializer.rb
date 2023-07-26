class EventSerializer < ActiveModel::Serializer
  attributes :id, :name, :date, :desc
end
