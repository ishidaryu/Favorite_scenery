class Public::SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    @range = params[:range]
    if @range == "ユーザー名"
      @users = User.looks(params[:search], params[:word])
    else
      @sceneries = Scenery.looks(params[:search], params[:word])
    end
  end
end
