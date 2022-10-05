class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:update, :edit]

  def show
  @user = User.find_by(id: params[:id])
  @sceneries = @user.sceneries
  end

  def edit
  end

  def favorites
    @user = User.find(params[:id])
    favorites = Favorite.where(user_id: @user.id).pluck(:scenery_id)
    @favorite_sceneries = Scenery.find(favorites)
  end

  private

    def user_params
      params.require(:user)
    end


end
