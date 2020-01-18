class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def show
    @booking = find_booking
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(extended_booking_params)
    if @booking.save!
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  private

  def extended_booking_params
    booking_params.merge(user_id: current_user.id)
  end

  def booking_params
    params.require(:booking).permit(:)
  end

  def find_booking
    @booking = Booking.find(params[:id])
  end
end
