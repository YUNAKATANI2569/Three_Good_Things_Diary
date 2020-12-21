Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:show, :index, :edit]do
    resources :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'

 end

  resources :diaries do
  resources :diary_comments, only: [:create, :destroy]
  resource :favorites, only: [:create, :destroy]
  end

  root 'homes#top'
  get 'home/about' => 'homes#about', as: 'about'
  get 'search' => 'searches#search'
end
