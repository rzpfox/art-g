Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/paintings', to: 'paintings#index', as: 'all_paintings'
  resources :galleries, :artists do
    resources :paintings, shallow: true, except: :index do
      resources :appointments, shallow: true
    end
  end

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :galleries, :artists, :paintings, only: [:index, :show]
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
