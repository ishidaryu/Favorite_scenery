class Public::GuestsController < ApplicationController

  def guest_sign_in
   user = User.find_or_create_by!(email: 'guest@example.com') do |user|
     user.password = SecureRandom.urlsafe_base64
     user.name = "ゲスト"

     user.skip_confirmation!
   end
   sign_in user
   redirect_to sceneries_path, notice: 'ゲストユーザーとしてログインしました。'
  end



end
