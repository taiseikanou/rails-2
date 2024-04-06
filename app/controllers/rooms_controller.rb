class RoomsController < ApplicationController
  def top
  end
  
  def index
    @rooms = Room.all
    @rooms = @rooms.where("address LIKE ?", "#{params[:address]}%") if params[:address].present?
    @rooms = @rooms.where("room_name LIKE ?", "#{params[:room_name]}%") if params[:room_name].present?
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
      flash[:notice] = "新規投稿しました"
      redirect_to root_path
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
      redirect_to root_path
    else
      render "edit"
    end
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    redirect_to root_path
  end

  private

  def room_params
    params.require(:room).permit(:room_name,:room_detail,:price,:address,:area,:image)
  end

end
