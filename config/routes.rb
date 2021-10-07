Rails.application.routes.draw do
  # 管理者側
  scope module: :public do
    devise_for :admins, controllers: {
      sessions: 'admin/admins/sessions',
      passwords: 'admin/admins/passwords',
    }
  end

  namespace :admin do
    resources :herbs
  end

  # ユーザ側
  scope module: :public do
    devise_for :users, skip: [:registrations],
                       controllers: {
                         sessions: 'public/users/sessions',
                         passwords: 'public/users/passwords',
                         # registrations: 'public/users/registrations'
                       }
    # sign_upに必要なrouting抜粋。users/edit被り&deviseのuser/edit使用しないため、editは記述しない。
    devise_scope :user do
      get 'users/sign_up' => 'users/registrations#new', as: :new_user_registration
      post 'users' => 'users/registrations#create', as: :user_registration
    end

    root to: 'homes#top'
    get 'about' => 'homes#about'

    resource :users, only: [:edit, :update]
    get "users/my_page" => "users#show"

    resources :herbs, only: [:index, :show] do
      resource :likes, only: [:create, :destroy]
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
