class Public::FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    @scenery = Scenery.find(params[:scenery_id])
    favorite = current_user.favorites.new(scenery_id: @scenery.id)
    favorite.save
  end

  def destroy
    @scenery = Scenery.find(params[:scenery_id])
    favorite = current_user.favorites.find_by(scenery_id: @scenery.id)
    favorite.destroy
  end
end
