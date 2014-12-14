Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    get '/login', to: 'devise/sessions#new'
    get '/signup', to: 'devise/registrations#new'
    delete '/logout', to: 'devise/sessions#destroy'
  end

  root to: 'class_scheduler#index'
end
