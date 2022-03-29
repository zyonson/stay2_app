class UsersController < ApplicationController
  def account
    @user=User.find(params[:id])
  end

end
