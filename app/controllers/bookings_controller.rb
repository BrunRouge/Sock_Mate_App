class BookingsController < ApplicationController
  def index
    @my_bookings  = current_user.bookings.order!('created_at DESC')
    @my_sales = Booking.where(previousowner_id: current_user.id).order!('created_at DESC')
  end

  def show
    @booking = find_booking
  end

  def create
    @booking = Booking.new(extended_booking_params)
    @sock = Sock.find(params[:sock_id])
    if payment_validation && transaction_validation
      flash[:notice] = "Transaction complete. Congratulations on your aquisition!"
      save_transaction
    else
      flash[:notice] = "Insufficient funds"
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

  def payment_validation # Add "Reverse/Rollback payment in case of failing transaction for whatever reason?"
    if current_user.funds >= @sock.price
      current_user.funds -= @sock.price
      @sock.user.funds += @sock.price
    else
      return false
    end
  end

  def transaction_validation
    @booking.previousowner_id = @sock.user.id  # Mark previous owner for purchasing/selling display
    @booking.sellprice = @sock.price # Mark transfer price when booking is done (for reference)
    @sock.user_id = current_user.id # Transfer of ownership
  end

  def save_transaction
    current_user.save!
    @sock.user.save!
    @booking.save!
    @sock.save!
  end
end
