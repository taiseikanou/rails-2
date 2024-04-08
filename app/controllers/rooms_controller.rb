class RoomsController < ApplicationController
  def top
  end

  def index
    @rooms = Room.all
    @rooms = @rooms.where("address LIKE ?", "#{params[:address]}%") if params[:address].present?
    if params[:search].present?
      @rooms = @rooms.where("room_name LIKE ? OR room_detail LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%")
    end
  end

  def own
    @rooms = current_user.rooms
  end

  def new
    @room = Room.new
  end

  def create
    @room = current_user.rooms.build(room_params)
    if @room.save
       redirect_to rooms_own_path
    else
      render :new
    end
  end

  def show
    @room = Room.find(params[:id])
    @reservation = Reservation.new
  end

  def edit
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])
    if @room.update(room_params)
      redirect_to rooms_own_path
    else
      render "edit"
    end
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    redirect_to rooms_own_path
  end

  private

  def room_params
    params.require(:room).permit(:room_name,:room_detail,:price,:address,:area,:image,:user_id)
  end

end
