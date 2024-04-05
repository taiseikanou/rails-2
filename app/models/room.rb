class Room < ApplicationRecord
    has_one_attached :image
    belongs_to :user
    has_many :reservations
    validates :room_name, presence: true
    validates :room_detail, presence: true
    validates :price, presence: true
    validates :address, presence: true
end
