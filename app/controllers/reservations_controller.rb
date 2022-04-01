class ReservationsController < ApplicationController
  before_action :permit_params, only: :create
 
  before_action :authenticate_user!
def index
  @reservations = Reservation.all
  
end
 

  def create
    @reservation =Reservation.new(@attr)
    @room = Room.find_by(id: @reservation.room_id)
    @reservation.stay_date
    @reservation.total_price
    @reservation.user_id= current_user.id
    @reservation.profile_id= current_user.id
    if @reservation.save
      flash[:notice] = "予約が完了しました"
      redirect_to :reservations
    else
      render "rooms/new"
    end
    
  end


  def edit
  end

  def update
  end

  def destroy
  end

  private

  def permit_params
   @attr = params.require(:reservation).permit(:start_date, :end_date, :stay_date, :count,:total_price, :user_id,:profile_id, :room_id)
  end



end
