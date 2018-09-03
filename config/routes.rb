Rails.application.routes.draw do
  get 'users/show'
  resources :users, only: [:show]
  devise_for :users
  
  root 'staticpages#home'
  get '/help' => 'staticpages#help'
  get '/about' => 'staticpages#about'
  get '/contact' => 'staticpages#contact'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
