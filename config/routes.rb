Rails.application.routes.draw do
# password変更とadmin側のregistration機能は今回不要なルーティングなのでskipオプションで取り消す
# 生成したコントローラーadmin,usersがどこに存在しているのかを記述


  devise_for :users, controllers: {
    sessinos: "users/sessions",
    registrations: "users/registrations"
  }

  devise_for :admin,skip: [:password, :registrations], controllers: {
    sessions: "admin/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
