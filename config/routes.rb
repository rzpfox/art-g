Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/paintings', to: 'paintings#index', as: 'all_paintings'
  resources :galleries do
    resources :paintings, shallow: true, except: :index do
      resources :appointments, shallow: true
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
