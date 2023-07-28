class User < ApplicationRecord
    has_many :merchandisers, dependent: :destroy
    has_many :sales_managers, dependent: :destroy
    has_many :route_plans, dependent: :destroy
    has_many :check_ins, dependent: :destroy
  
    
    validates :username, presence: true
    validates :email, presence: true
    validates :password_digest, presence: true
    validates :role, presence: true, inclusion: { in: %w(merchandiser sales_manager) }
  
  
end
