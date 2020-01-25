class UsersController < ApplicationController
  def profile
     @my_socks = current_user.socks.where(status: 'active').order(created_at: :desc)
   unless current_user.socks_acquired == 0
     @my_acquired_socks = current_user.socks_acquired
   else
     @my_acquired_socks = "You have yet to acquire your first sock."
   end
  end
end
