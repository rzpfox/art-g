Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/paintings', to: 'paintings#index', as: 'all_my_paintings'
  get '/galleries/all', to: 'galleries#all', as: 'all_galleries'
  get '/paintings/all', to: 'paintings#all', as: 'all_paintings'
  get '/artists/all', to: 'artists#all', as: 'all_artists'
  resources :galleries, :artists do
    resources :paintings, shallow: true, except: :index
  end

  resources :appointments

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :galleries, :artists, :paintings, only: [:index, :show]
    end
  end
end
