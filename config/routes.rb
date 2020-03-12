Rails.application.routes.draw do
  devise_for :users
  resources :blogs
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'static#home'
  # get '/', to: 'static#home'
end
