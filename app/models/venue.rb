class Venue < ApplicationRecord
  belongs_to :user
  has_many :tickets, dependent: :destroy 
  has_many :users, through: :tickets 

  scope :alpha, -> { order(:name) }
  scope :most_tickets, -> { left_joins(:tickets).group('venues.id').order('count(tickets.venue_id) desc') } 

  validates :name, presence: true 
  
  validates :name, uniqueness: {scope: :user_id, message: "already exists"} 

  def self.search(params)
    where("LOWER(name) LIKE ?", "%#{params}%")
  end 
end
