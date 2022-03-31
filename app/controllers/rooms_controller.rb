class RoomsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :search]
  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(params.require(:room).permit(:room_name,:room_description,:price,:address,:image,:user_id))
    @room.user = current_user
    @room.profile_id = current_user.id
    if @room.save
      flash[:notice] = "ルームを新規登録しました"
      redirect_to :rooms
    else
      flash[:notice] = "登録に失敗しました"
      render "new"
    end
  end

  def show
    @room = Room.find(params[:id])
    @profile = Profile.find_by(id: @room.user_id)
    @reservation = Reservation.new
    binding.pry
  end

 

  def edit
    @room = Room.find(params[:id])
  end

  def update
    @room = room.find(params[:id])
    if @room.update(params.require(:room).permit(:room_name,:room_description,:price,:address,:image))
      flash[:notice] = "ルームを更新しました"
      redirect_to :rooms
    else
        flash[:notice] = "更新に失敗しました"
        render "edit"
    end
  end

  def destroy
  end

end
