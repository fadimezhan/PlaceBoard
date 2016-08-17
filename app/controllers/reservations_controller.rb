class ReservationsController < ApplicationController
  def create
    @place = Place.find(params[:place_id])
    @reservation = @place.reservations.new(reservation_params)
    @reservation.customer = current_customer

    if @reservation.save
      redirect_to @place
    else
      redirect_to @place, notice: " Not Valid!"
    end
  end

  def destroy
    @place = Place.find(params[:place_id])
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to @place
  end

  private

  def reservation_params
    params.require(:reservation).permit(:date, :number_of_people)
  end
end
