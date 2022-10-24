class ApplicationController < ActionController::Base
#deviseのコントローラーはライブラリで用意されているので直接修正できない
# よってdeviseのコントローラに修正が必要なときは、application_controllerに記述します
# 初期設定ではemailとpasswordしか許可されていないのでここでnameを追加する
before_action :configure_permitted_parameters, if: :devise_controller?
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :profile_image])
  end

  def after_sign_out_path_for(resource)
    if resource == :user
      about_path
    elsif resource == :admin
      new_admin_seccion_path
    end
  end
end
