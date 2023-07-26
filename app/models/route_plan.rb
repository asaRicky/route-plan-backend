class RoutePlan < ApplicationRecord
    has_many :route_visits
    belongs_to :user
end
