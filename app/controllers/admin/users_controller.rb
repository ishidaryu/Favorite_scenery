class Admin::UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params[:id])
    @sceneries = @user.sceneries
  end
  
  def destroy
    User.find(params[:id]).destroy
    head :no_content
  end
end
