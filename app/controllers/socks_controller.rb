class SocksController < ApplicationController
  def index
    @socks = Sock.all
  end

  def show
    @sock = set_sock
  end

  def new
    @sock = Sock.new
  end

  def create
    @sock = Sock.new(sock_params)
    @sock['user_id'] = current_user.id
    if @sock.save
      redirect_to sock_path(@sock)
    else
      render :new
    end
  end

  def edit
    @sock = set_sock
  end

  def update
    @sock = Sock.find(set_sock.id)
    if @sock.update(sock_params)
      redirect_to sock_path(@sock)
    else
      render :new
    end
  end

  def destroy
    @sock = Sock.find(set_sock.id)
    @sock.destroy

    redirect_to socks_path
  end

  private

  def sock_params
    params.require(:sock).permit(:size, :price, :textile, :color)
  end

  def set_sock
    @sock = Sock.find(params[:id])
  end
end
