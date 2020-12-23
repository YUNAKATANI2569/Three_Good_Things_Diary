Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # ---ゲストログイン----
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  # --------------

  resources :users, only: [:show, :index, :edit, :update]do
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
