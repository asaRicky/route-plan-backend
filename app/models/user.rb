class User < ApplicationRecord
    has_many :merchandisers, dependent: :destroy
    has_many :sales_managers, dependent: :destroy
    has_many :route_plans, dependent: :destroy
    has_many :check_ins, dependent: :destroy
  
    
    validates :email, presence: true, uniqueness: true
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP}
    validates :username, presence: true, uniqueness: true
    validates :password_digest, length: {minimum: 6}, if: -> { new_record? || !password_digest.nil?}
    # validates :role, presence: true, inclusion: { in: %w(merchandiser sales_manager) }
  
  
end
