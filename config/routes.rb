Rails.application.routes.draw do

  devise_for :admin, skip: [:registration, :password], controllers: {
    sessions: "admins/sessions"
  }

  devise_for :user, skip: [:password], controllers: {
    registrations: "users/registrations",
    sessions: "users/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

 scope module: :users do
   get "/", to: "homes#top"
 end


end
