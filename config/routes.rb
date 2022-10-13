Rails.application.routes.draw do
# userと同様にskip: :[password, :registratin]を記述していたのだがするとNo method error Admin#sessionというエラーがでてしまい調べたところ
# skip の記述を消せば解決するとあったのでその通りにするとエラー解決
  devise_for :admin, controllers: {
    sessions: "admins/sessions"
  }
  devise_for :user, skip: [:password], controllers: {
    registrations: "users/registrations",
    sessions: "users/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

# ファイル構成は指定し、urlは変えたくないのでmoduleを使用
 scope module: :users do
  # 通常の指定方法　
  # メソッド(get) "url", to: "controller#action", as: "パス名指定"
   get "/", to: "homes#top", as: "root"
   get "/about", to: "homes#about"
  # resourcesメソッド [index,create,new,show,update,edit,destroy]を自動で作成
  # onlyを使うことで不要なルーティングを制限
   resources :users, only:[:show, :edit, :update, :destroy] do
    # member　で自分でアクションを作ることが出来る。　collectionとの違いはurlにidを指定するかしないか
     member do
       get :confirm
       get :like
       get :following
       get :follower
     end
    # usersにネストさせることでuser_id/postsというように特定のuserのindexとshowにすることができる
     resources :posts, only: [:index, :show]
   end
   resources :posts, only:[:new, :create, :destroy]
 end
end
