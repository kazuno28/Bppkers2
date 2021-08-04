Rails.application.routes.draw do
  root to: 'homes#top'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  resources :books do
    resource :favorites, only: [:create, :destroy]

    resources :post_comments, only: [:create, :destroy]
  end


  get "home/about" => "homes#about"
  resources :homes
  post 'users' => 'users#create'
end
