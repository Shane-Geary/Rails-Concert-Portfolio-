class Venue < ApplicationRecord
  belongs_to :user
  belongs_to :ticket

  validates :name, presence: :true 
end
