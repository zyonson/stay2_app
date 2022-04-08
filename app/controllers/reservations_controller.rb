class ReservationsController < ApplicationController
  before_action :permit_params, only: :create
 
  before_action :authenticate_user!
def index
  @reservations = Reservation.where(user_id: current_user.id)
end

def back
  @reservation = Reservation.new(permit_params)
  @room = Room.find(@reservation.room_id)
  @profile = Profile.find(@reservation.profile_id)
  render "rooms/show"
end
def confirm
  @reservation =current_user.reservations.new(permit_params)
  @room = Room.find(@reservation.room_id)
  @profile = Profile.find(@reservation.profile_id)
  
  render 'rooms/show' if @reservation.invalid?
end

def create
  @reservation = current_user.reservations.new(permit_params)
  @room = Room.find(@reservation.room_id)
  if @reservation.save
    flash[:notice] = "予約が完了しました"
    redirect_to :reservations
  else
    render "rooms/show"
  end
end
 
private

  def permit_params
   params.require(:reservation).permit(:start_date, :end_date, :count, :user_id,:room_id,:profile_id)
  end

end
