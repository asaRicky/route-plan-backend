class Outlet < ApplicationRecord
    has_many :check_ins, dependent: :destroy

   validates :name, presence: true
   validates :address, presence: true
end
