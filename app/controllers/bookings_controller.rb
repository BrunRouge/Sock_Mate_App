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
end
