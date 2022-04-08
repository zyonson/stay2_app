class Reservation < ApplicationRecord
    belongs_to :user
    belongs_to :room
    belongs_to :profile

    with_options presence: true do
      validates :start_date
      validates :end_date
      validates :count
    end

    validate :date_check
    validate :start_date_check

    def date_check
      return if end_date.blank? || start_date.blank?
      errors.add(:end_date, "は予約開始日以降の日をお選びください") unless
      start_date < end_date
    end

    def start_date_check
      errors.add(:start_date, "は本日以降の日をお選びください")if start_date != nil && end_date != nil && start_date < Date.today
    end

    def stay_date
      (self.end_date - self.start_date).to_i
    end
    
    def total_price
      self.stay_date.to_i * self.count.to_i * self.room.price
    end
  
end
