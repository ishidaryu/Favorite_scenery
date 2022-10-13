class Public::GuestSessionsController < ApplicationController
  skip_before_action :login_required

  def create
    user = User.find_by(eamil: 'test@example.com')
    log_in(user)
    flash[:success] = 'ゲストユーザーでログインしました'
    flash[:warning] = 'よろしくお願いします！'
    redirect_to sceneries_path
  end

end
