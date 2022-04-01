class Reservation < ApplicationRecord
    belongs_to :user
    belongs_to :profile
    belongs_to :room

   def stay_date
       (end_date - start_date).to_i
   end
    
   def total_price
    stay_date*count*room.price
   end

  
end
