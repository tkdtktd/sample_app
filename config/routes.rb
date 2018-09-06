Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => "registrations"
  }
  resources :users, only: [:show, :index, :destroy]
  resources :microposts, only: [:create, :destroy]

  root 'staticpages#home'
  get '/help' => 'staticpages#help'
  get '/about' => 'staticpages#about'
  get '/contact' => 'staticpages#contact'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
