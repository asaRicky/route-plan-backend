class Merchandiser < ApplicationRecord
    belongs_to :user
    has_many :check_ins, dependent: :destroy
    has_many :route_plans, dependent: :destroy
  
    validates :name, presence: true
    validates :contact_number, presence: true
end
