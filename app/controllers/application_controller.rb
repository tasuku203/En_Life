class ApplicationController < ActionController::Base
  # 以下の７行目までの記述はuser/registrationsコントローラーに記述しないと意味がなかった。
  # before_action :configure_permitted_parameters, if: :devise_controller?

  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  # end
end
