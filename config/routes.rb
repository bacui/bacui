Rails.application.routes.draw do
  devise_for :users
  resources :tasks
  resources :courses
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
