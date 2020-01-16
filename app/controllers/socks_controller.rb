class SocksController < ApplicationController
  def index
    @socks = Sock.all
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def sock_params
    params.require(:sock).permit(:size, :price, :textile, :color)
  end

  def set_sock
    @sock = Sock.find(params[:id])
  end
end
