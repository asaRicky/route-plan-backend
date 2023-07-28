class CheckIn < ApplicationRecord
        belongs_to :user
        belongs_to :outlet
      
        validates :check_in_timestamp, presence: true
end
