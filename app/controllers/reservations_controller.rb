class ReservationsController < ApplicationController

  # POST   /restaurants/:restaurant_id/reservations
  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.user = current_user
    @restaurant = Restaurant.find(params[:restaurant_id])
    @reservation.restaurant = @restaurant

    if @reservation.save
      redirect_to restaurant_path(@restaurant)
    else
      render "restaurants/show"
    end
  end

  def reservation_params
    params.require(:reservation).permit(:date)
  end
end