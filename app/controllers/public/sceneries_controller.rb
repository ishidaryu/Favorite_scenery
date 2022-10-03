class Public::SceneriesController < ApplicationController

  def index
  @scenery = Scenery.new
  @sceneries = Scenery.all
  end

  def create
  @scenery = Scenery.new(scenery_params)
  @scenery.user_id = current_user.id
  @scenery.save
  redirect_to sceneries_path
  end

  def show
    @scenery = Scenery.find_by(id: params[:id])
  end


  def edit
  @scenery = Scenery.find_by(id: params[:id])
  end

  def update
  @scenery = Scenery.find_by(id: params[:id])
  @scenery.update(scenery_params)
  redirect_to  scenery_path(@scenery)
  end

private

  def scenery_params
    params.require(:scenery).permit(:name, :introduction, :scenery_image)
  end
end
