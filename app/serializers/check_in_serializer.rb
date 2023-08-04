class CheckInSerializer < ActiveModel::Serializer
  attributes :id,:user_id, :outlet_id, :check_in_timestamp

  belongs_to :user
  belongs_to :outlet
end
