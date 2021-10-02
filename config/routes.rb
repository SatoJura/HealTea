Rails.application.routes.draw do
  scope module: :public do
    devise_for :users, controllers:{
      sessions:      'public/users/sessions',
      registrations: 'public/users/registrations'
    }
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
