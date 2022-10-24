class Public::SceneriesController < ApplicationController

  def index
    @scenery = Scenery.new
    @sceneries = Scenery.all.page(params[:page]).per(15)
    @search = Scenery.ransack(params[:q])
    @scenerys = Scenery.find_by(id: params[:id])
    @genres = Genre.all
    @user = current_user
  end

  def create
    @scenery = Scenery.new(scenery_params)
    @scenery.user_id = current_user.id
    if @scenery.save
    redirect_to user_path(current_user.id)
    else
    @sceneries = Scenery.all.page(params[:page]).per(15)
    @genres = Genre.all
    @user = current_user
    render :index
    end
  end

  def show
    @scenery = Scenery.find_by(id: params[:id])
    @user = @scenery.user
    @scenery_comment = SceneryComment.new
  end

  def destroy
    @scenery = Scenery.find_by(id: params[:id])
    @scenery.destroy
    redirect_to user_path(current_user.id)
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
    params.require(:scenery).permit(:name, :introduction, :scenery_image, :genre_id)
  end
end
