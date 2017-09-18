Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#home'
  get '/sobre-nosotros', to: 'static_pages#about'
  get '/oauth2callback', to: 'static_pages#oauth2callback'

  resources :posts
end
