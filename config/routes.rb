Rails.application.routes.draw do

  root 'welcome#index'

  get 'login' => "sessions#new"
  post 'login' => "sessions#create"
  get 'logout' => "sessions#destroy", as: :logout
  get 'register' => "users#new"
  post 'register' => "users#create"
  get 'about' => "about#index", as: :about

  resources :users, except: [:index, :destroy] do
    member do
      patch "collect_course"
      patch "remove_course"
      patch "collect_score"
      patch "remove_score"
    end
  end

  resources :messages

  resources :courses, only: [:show, :index]
  resources :scores, only: [:show, :index]
  resources :comments, only: [:create]
  resources :columns, only: [:index, :show]

  resources :tags, only: [:index, :show]
  resources :photo_shows, only: [:index, :show]

  namespace :admin do
    get 'login' => 'sessions#new', as: :login
    post 'login' => 'sessions#create'
    delete 'login' => 'sessions#destroy'

    get '/' => 'dashboard#index'

    resources 'courses'
    resources 'scores' do
      member do
        patch 'update_images_order'
      end
    end

    resources 'columns' do
      member do
        patch 'update_images_order'
      end
    end

    resources 'users', only: [:index, :create, :new] do
      member do
        get 'frozen'
      end
    end

    resources 'advertisements'

    resources 'comments', only: [:create, :destroy] do
      member do
        patch 'block'
        patch 'unblock'
      end
    end

    resources 'tags'
    resources 'photo_shows'
  end

end
