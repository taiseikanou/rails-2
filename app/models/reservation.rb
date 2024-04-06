class Reservation < ApplicationRecord
  belongs_to :room
  belongs_to :user

  validates :check_in, presence: true
  validates :check_out, presence: true
  validates :number_of_guests, presence: true
  validates :number_of_guests, numericality: { only_integer: true, greater_than: 0 }
  validate :check_in_date_after_today
  validate :check_out_after_check_in

  def check_out_after_check_in
    if check_in.present? && check_out.present? && check_out <= check_in
      errors.add(:check_out, "はチェックイン日より後の日付を選択してください")
    end
  end

  def check_in_date_after_today
    if check_in.present? && check_in <= Date.today
      errors.add(:check_in, "は今日よりも後の日付を選択してください")
    end
  end




  def reservation_duration
    ((check_out - check_in) / 1.day).to_i
  end

  def total_price
    reservation_duration*room.price*number_of_guests
  end

end
