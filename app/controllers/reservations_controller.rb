class ReservationsController < ApplicationController
  before_action :permit_params, only: :cofirm
  before_action :set_extra_information, only: :cofirm
  before_action :authenticate_user!

 

  def back
    @reservation = Reservation.new
        render 'show'
  end

  def confirm
    @reservation = current_user.reservations.new(@attr)
    @room = Room.find_by(id: @reservation.room_id)
    @reservation.profile_id = current_user.id
    @reservation.user_id = current_user.id
    binding.pry
    render 'rooms/show' if @reservation.invalid?
  end

  def complete
    Reservation.create!(@attr)
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

  def set_extra_information
    permit_params.merge(@reservation.set_extra_information)
  end

end
