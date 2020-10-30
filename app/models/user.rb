class User < ApplicationRecord
    has_secure_password 

    has_many :tickets 
    has_many :venues 
    has_many :venue_tickets, through: :venues,
    source: :ticket 
end
