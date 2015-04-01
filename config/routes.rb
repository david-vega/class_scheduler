Rails.application.routes.draw do

  get ':classroom_name/calendar', to: 'calendar#show'

  devise_for :users

  devise_scope :user do
    get '/login', to: 'devise/sessions#new'
    get '/signup', to: 'devise/registrations#new'
    delete '/logout', to: 'devise/sessions#destroy'
  end

  # namespace :api do
  #   api_version(module: 'v1', path: {value: 'v1'}) do
  #     resources :buildings
  #     resources :classrooms
  #     resources :reservations
  #     resources :users
  #     post '/search', to: 'search#index'
  #   end
  # end

  # match '/calendar' => 'class_scheduler#index', format: false, via: [:get, :post]

  root to: 'calendar#show'
end
