class Admin::SceneriesController < ApplicationController

  def show
    @scenery = Scenery.find_by(id: params[:id])
    @user = @scenery.user
    @scenery_comment = SceneryComment.new
  end

  def destroy
    @sceneries = Scenery.find_by(id: params[:id])
    @sceneries.destroy
    redirect_to admin_user_path(@sceneries)
  end


end
