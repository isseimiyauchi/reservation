class ReservationsController < ApplicationController
  def index
    @reservations = current_user.reservations.all
  end

  def confirm
    @reservation = Reservation.new(params_reservation)
  end

  def back
    @reservation = Reservation.new(permit_params)
    redirect_to :back
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

 
 
  def create
    @reservation = Reservation.new(params_reservation)
    if @reservation.save
      flash[:notice] = "予約を受け付けました。"
      redirect_to @reservation
   else
      render "posts"
    end
  end


  private

  def params_reservation
    params.require(:reservation).permit(:start_date, :end_date, :number_of_people, :number_of_day, :total_price, :room_id, :user_id)
  end
end
