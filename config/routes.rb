Rails.application.routes.draw do

  devise_for :admin, skip: [:registrations, :password], controllers: {
    sessions: "admin/sessions"
  }

  devise_for :user, skip: [:password], controllers: {
    registrations: "user/registrations",
    sessions: "user/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

 scope module: :users do
   get "/", to: "homes#top"
 end


end
