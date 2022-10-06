Rails.application.routes.draw do

  devise_for :admin, controllers: {
    sessions: "admin/sessions"
  }
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
