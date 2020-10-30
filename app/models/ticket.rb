class Ticket < ApplicationRecord
  belongs_to :user
  has_many :venues 
  has_many :users, through: :venues
end
