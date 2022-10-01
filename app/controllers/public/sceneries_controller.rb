class Public::SceneriesController < ApplicationController

  def index
  @scenery = Scenery.new
  @sceneries = Scenery.all
  end

  def create
  @scenery = Scenery.new(scenery_params)
  @scenery.save
  redirect_to  sceneries_path
  end

private

  def scenery_params
    params.require(:scenery).permit(:name, :introduction)
  end
end
