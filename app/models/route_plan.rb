class RoutePlan < ApplicationRecord
        belongs_to :user
        belongs_to :merchandiser
        has_many :check_ins, through: :merchandiser
      
        validates :start_date, presence: true
        validates :end_date, presence: true      
end
