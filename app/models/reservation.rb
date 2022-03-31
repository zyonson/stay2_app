class Reservation < ApplicationRecord
    belongs_to :user
    belongs_to :profile
    belongs_to :room

   def stay_date
       end_date.to_i - start_date.to_i
   end
    
   def total_price
    count
   end

   def set_extra_information
    {:stay_date => stay_date, :total_price => total_price}
   end
end
