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
    resources :tags, only: [:index, :edit, :update, :destroy]
  end

  # ユーザ側
  scope module: :public do
    devise_for :users, skip: [:registrations],
                       controllers: {
                         sessions: 'public/users/sessions',
                         passwords: 'public/users/passwords',
                       }
    # sign_upに必要なrouting抜粋。users/editが被っている&deviseのuser/edit使用しないため、editは記述しない。
    devise_scope :user do
      get 'users/sign_up' => 'users/registrations#new', as: :new_user_registration
      post 'users/sign_up' => 'users/registrations#create', as: :user_registration
    end

    root to: 'homes#top'
    get 'about' => 'homes#about'

    resource :users, only: [:edit, :update]
    get "users/my_page" => "users#show"

    resources :herbs, only: [:index, :show] do
      resource :likes, only: [:create, :destroy]
      resources :post_comments, only: [:create, :destroy]
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
