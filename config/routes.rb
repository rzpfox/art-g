Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'
  get '/searches/:term', to: 'searches#show', as:'search_results'
  post '/searches', to: 'searches#show'



  get '/paintings', to: 'paintings#index', as: 'all_my_paintings'
  get '/galleries/all', to: 'galleries#all', as: 'all_galleries'
  get '/paintings/all', to: 'paintings#all', as: 'all_paintings'
  get '/artists/all', to: 'artists#all', as: 'all_artists'
  get '/exhibitions/all', to: 'exhibitions#all', as: 'all_exhibitions'

  resources :galleries do
    resources :paintings, shallow: true, except: :index
    resources :appointments, shallow: true
  end

  resources :exhibitions do
    resources :samples, shallow: true
  end
  resources :artists

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :galleries, :artists, :paintings, only: [:index, :show]
    end
  end
end
