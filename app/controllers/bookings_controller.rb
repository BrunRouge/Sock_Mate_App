class BookingsController < ApplicationController
  def index
    @my_bookings  = current_user.bookings
    @my_sales = Booking.where(previousowner_id: current_user.id)
  end

  def show
    @booking = find_booking
  end

  def create
    @booking = Booking.new(extended_booking_params)
    @sock = Sock.find(params[:sock_id])
    if payment
      if transaction
        flash[:notice] = "Transaction complete. Congratulations on your aquisition!"
      else
        flash[:notice] = "Oof, something went wrong here"
      end
    end
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

  private

  def payment # Add "Reverse/Rollback payment in case of failing transaction for whatever reason?"
    if current_user.funds >= @sock.price
      current_user.funds -= @sock.price
      @sock.user.funds += @sock.price
      current_user.save!
      @sock.user.save!
    else
      flash[:notice] = "Insufficient funds"
      return false
    end
  end

  def transaction
    @booking.previousowner_id = @sock.user.id  # Mark previous owner for booking display
    @booking.sold_by =
    @booking.sellprice = @sock.price # Mark transfer price when booking is done (for reference)
    @booking.save!
    @sock.user_id = current_user.id # Transfer of ownership
    @sock.save!
  end
end
