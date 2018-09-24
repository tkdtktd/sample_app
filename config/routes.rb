Rails.application.routes.draw do
  get 'contacts/new'
  devise_for :users, :controllers => {
    :registrations => "registrations"
  }
  resources :users, only: [:show, :index, :destroy] do
    member do
      get :following, :followers
    end
  end

  resources :microposts, only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]
  resources :contacts, only: [:new, :create]

  root 'staticpages#home'
  get '/help' => 'staticpages#help'
  get '/about' => 'staticpages#about'
  get '/contact' => 'contacts#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
