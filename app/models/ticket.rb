class Ticket < ApplicationRecord
  belongs_to :user
  belongs_to :venue 

  validates :name, :date, :artist, presence: true 
  
  validates :name, uniqueness: {scope: :user_id, message: "already exists"} 
end
