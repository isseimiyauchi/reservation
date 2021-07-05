
Rails.application.routes.draw do
  devise_for :users, controllers: {
        registrations: 'users/registrations'
}
  root 'pages#index'
  get 'users/profile/:id', to: 'users#profile', as: 'user_profile'
  get 'users/acount/:id', to: 'users#acount', as: 'user_acount'
  resources :rooms do
    collection do
      get 'search'
      get 'posts'
    end
  end 
  resources :reservations do
    collection do
      post 'confirm'
      post 'back'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

