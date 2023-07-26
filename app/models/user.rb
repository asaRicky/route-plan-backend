class User < ApplicationRecord
    has_many :route_plans
    has_many :route_visits, through: :route_plans
end
