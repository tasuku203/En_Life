Rails.application.routes.draw do
# userと同様にskip: :[password, :registratin]を記述していたのだがするとNo method error Admin#sessionというエラーがでてしまい調べたところ
# skip の記述を消せば解決するとあったのでその通りにするとエラー
  devise_for :admin, controllers: {
    sessions: "admins/sessions"
  }
  devise_for :user, skip: [:password], controllers: {
    registrations: "users/registrations",
    sessions: "users/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

 scope module: :users do
   get "/", to: "homes#top", as: "root"
   get "/about", to: "homes#about"
 end


end
