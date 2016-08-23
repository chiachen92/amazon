Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/home' => 'home#home', as: :home
  get '/about' => 'home#about', as: :about
  get '/contact' => 'contact#contact', as: :contact
  post '/contact' => 'contact#thanks', as: :thanks

  get '/' => 'products#index', as: :root

  resources :products do
    resources :reviews, only: [:create, :destroy]
    resources :categories, only: [:create]
  end

  resources :users, only: [:new, :create]

  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end



  get '/products/page/:page' => 'products#pages', as: :pages



end
