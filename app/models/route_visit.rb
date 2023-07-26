class RouteVisit < ApplicationRecord
    belongs_to :user
    belongs_to :outlet
    belongs_to :route_plan
end
