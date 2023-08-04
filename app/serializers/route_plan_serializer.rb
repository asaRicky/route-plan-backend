class RoutePlanSerializer < ActiveModel::Serializer
  attributes :id,:user_id, :merchandiser_id, :start_date, :end_date

  belongs_to :user
  belongs_to :merchandiser
end
