class Room < ApplicationRecord
    validates :room_name,{presence: true}
    validates :adress,{presence: true}
    validates :price,{presence: true}
    validates :user_id,{presence: true}
    validates :room_introduction,{length: {maximum: 100}}

    belongs_to :user
    has_many :reservations

    has_one_attached :image
end
