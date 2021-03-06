class Profile::ReservationsController < ApplicationController

  def index
    @reservations = current_user.reservations
    ap "je suis la"
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to profile_reservations_path
  end

  private

  def reservation_params
    params.require(:reservation).permit(:date)
  end
end
