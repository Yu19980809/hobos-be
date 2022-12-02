class User < ApplicationRecord
  has_many :bookings
  has_many :shows, through: :bookings
end
