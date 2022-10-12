class Admin::SceneriesController < ApplicationController

  def show
    @users = User.find(params[:id])
    @sceneries = @users.sceneries
  end

  def destroy
    @sceneries = Scenery.find_by(id: params[:id])
    @sceneries.destroy
    redirect_to admin_scenery_path(@sceneries)
  end


end
