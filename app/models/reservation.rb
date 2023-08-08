class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :videogame

  validates :days, presence: true
  validates :total_price, presence: true
end
