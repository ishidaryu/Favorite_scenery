class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:update, :edit]

  def show
  @user = User.find(params[:id])
  @sceneries = @user.sceneries
  end

  def edit
  end

  private

    def user_params
      params.require(:user)
    end

end
