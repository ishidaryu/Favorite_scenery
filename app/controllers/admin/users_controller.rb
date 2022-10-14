class Admin::UsersController < ApplicationController

  def index
    @users = User.all
  end

  def destroy
    User.find(params[:id]).destroy
    head :no_content
  end
end
