class Venue < ApplicationRecord
  belongs_to :user
  has_many :tickets, dependent: :destroy 
  has_many :users, through: :tickets 

  scope :alpha, -> { order(:name) }
  scope :most_tickets, -> { joins(:tickets).group('venues.id').order('count(venues.id) desc') } 

  validates :name, presence: :true 
end
