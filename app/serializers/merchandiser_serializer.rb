class MerchandiserSerializer < ActiveModel::Serializer
  attributes :id,:name, :contact_number

  belongs_to :user
end
