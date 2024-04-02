class ReservationsController < ApplicationController

  def index
    @reservations = Reservation.all
  end

  def confirm
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.save
    redirect_to root_path
  end

  def show
  end

  def edit
    @reservation = Reservation.find(params[:id])
  end

  def update
    @reservation = Reservation.find(params[:id])
    if @reservation.update(reservation_params)
      redirect_to root_path
    else
      render "edit"
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to root_path
  end

  private

  def reservation_params
    params.require(:reservation).permit(:check_in,:check_out,:number_of_guests,:room_id)
  end
  
end