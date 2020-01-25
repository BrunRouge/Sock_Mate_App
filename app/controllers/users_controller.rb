class UsersController < ApplicationController
  def profile
   @my_socks = current_user.socks.where(status: 'active').order(created_at: :desc)
  end
end
