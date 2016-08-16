class ReservationsController < ApplicationController
  def create
    @place = Place.find(params[:place_id])
    @reservation = @place.reservations.new(reservation_params)
    @reservation.customer = current_customer

    if @reservation.save
      redirect_to @place
    else
      render 'new'
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:date, :number_of_people)
  end
end
