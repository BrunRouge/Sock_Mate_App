class BookingsController < ApplicationController
  def index
    @my_bookings  = current_user.bookings
  end

  def show
    @booking = find_booking
  end

  def create
    @booking = Booking.new(extended_booking_params)
    @sock = Sock.find(params[:sock_id])
    @booking.previousowner_id = @sock.user.id  # Mark previous owner for booking display
    @booking.sellprice = @sock.price # Mark transfer price when booking is done (for reference)
    @booking.save!
    @sock.user_id = current_user.id # Transfer of ownership
    @sock.save!
    redirect_to sock_path(@sock)
  end

  private

  def extended_booking_params
    booking_params.merge(user_id: current_user.id)
  end

  def booking_params
    params.permit(:sock_id)
  end

  def find_booking
    @booking = Booking.find(params[:id])
  end
end
