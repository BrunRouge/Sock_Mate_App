class SocksController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if current_user
      @my_socks = current_user.socks
      @not_my_socks = Sock.all - @my_socks
    else
      @my_socks = []
      @not_my_socks = Sock.all.where(status: 'active').order(created_at: :desc)
    end
    @any_my_socks = @my_socks.any?
    @my_active_socks = @my_socks.where(status: 'active').order(created_at: :desc)
    @other_active_socks = @not_my_socks
  end

  def show
    @sock = find_sock
    @owner = @sock.user
  end

  def new
    @sock = Sock.new
  end

  def create
    @sock = Sock.new(extended_sock_params)
    if @sock.save
      redirect_to sock_path(@sock)
    else
      render :new
    end
  end

  def edit
    @sock = find_sock
  end

  def update
    @sock = Sock.find(find_sock.id)
    if @sock.update(sock_params) && @sock.user == current_user
      redirect_to sock_path(@sock)
    else
      render :new
    end
  end

  def status_hide
    @sock = find_sock
    if current_user == @sock.user
      @sock.status.hidden
      @sock.save!
      redirect_to socks_path
    else
      head :not_found
    end
  end

  private

  def extended_sock_params
    final_params = sock_params.merge(user_id: current_user.id)
  end

  def sock_params
    params.require(:sock).permit(:size, :price, :textile, :color)
  end

  def find_sock
    @sock = Sock.find(params[:id])
  end
end
