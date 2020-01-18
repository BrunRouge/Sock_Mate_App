class SocksController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  def index
    @socks = Sock.all
  end

  def show
    @sock = find_sock
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
    if @sock.update(sock_params)
      redirect_to sock_path(@sock)
    else
      render :new
    end
  end

  def destroy
    @sock = Sock.find(find_sock.id)
    @sock.destroy

    redirect_to socks_path
  end

  private

  def extended_sock_params
    sock_params.merge(user_id: current_user.id)
  end

  def sock_params
    params.require(:sock).permit(:size, :price, :textile, :color)
  end

  def find_sock
    @sock = Sock.find(params[:id])
  end
end
