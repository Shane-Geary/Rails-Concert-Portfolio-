class User < ApplicationRecord
    has_secure_password 

    has_many :tickets 
    has_many :venues 
    has_many :ticket_venues, through: :tickets, 
    source: :venue 

    validates :username, presence: true 

    validates :username, uniqueness: true 
end
