Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'posts/dashboard', to: 'posts#new'
  post 'posts/create', to: 'posts#create', as: 'posts'

  
  root 'posts#index'
end
