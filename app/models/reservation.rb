class Reservation < ApplicationRecord
  belongs_to :room
  belongs_to :user

  validates :check_in, presence: true
  validates :check_out, presence: true
  validates :number_of_guests, presence: true
  validates :number_of_guests, numericality: { only_integer: true, greater_than: 0 }
  
  def reservation_duration
    ((check_out - check_in) / 1.day).to_i
  end

  def total_price
    reservation_duration*room.price*number_of_guests
  end

end
