# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  before_action :user_state, only: [:create]
  
  def guest_sign_in
    user = User.guest
    sign_in user
    redirect_to root_path, flash: {guest_success: "ゲストユーザーとしてログインしました"}
  end

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

   protected
  # 退会しているか判断するメソッド
   def user_state
    # 入力されたemailからアカウントを一件取得
     @user = User.find_by(email: params[:user][:email])
    # アカウントを取得できなかった場合このメソッドを終了する
     return if !@user
    # 取得したアカウントのパスワードと入力したパスワードが一致しているかを確かめる
     if @user.valid_password?(params[:user][:password])
     end
   end
  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
