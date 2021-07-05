class Reservation < ApplicationRecord
    validates :user_id,{presence: true}
    validates :room_id,{presence: true}
    validates :total_price,{presence: true}
    validates :number_of_people,{presence: true,
                      numericality: true}
    validate :date_before_start
    validate :date_before_end
                  
    def date_before_start
      if  start_date.blank? || start_date < Date.today
        errors.add(:start_date, "は今日以降のものを選択してください") 
      end
    end
                  
    def date_before_end
      if end_date.blank? || end_date < Date.today
        errors.add(:end_date, "は今日以降のものを選択してください") 
      end
    end                  

    belongs_to :user
    belongs_to :room

end
