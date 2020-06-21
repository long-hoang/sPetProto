Rails.application.routes.draw do
  
  devise_for :users
  
  mount Ckeditor::Engine => '/ckeditor'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 
  root 'static_pages#index'
  resources :courses, only: [:index, :show] do
    resources :plans, only: :create
    resources :sections, only: [:show, :destroy, :edit, :update]
  end

  resources :users, only: :show do
  end



  namespace :instructor do
    resources :sections, only: [:update]
    resources :courses, only: [:new, :create, :show, :edit, :update, :destroy] do
      resources :sections, only: [:new, :create, :destroy]
    end
  end
end
