Rails.application.routes.draw do
  
  devise_for :users
  
  mount Ckeditor::Engine => '/ckeditor'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 
  root 'static_pages#index'
  resources :courses, only: [:index, :show] do
    resources :plans, only: :create
  end

  resources :users, only: :show do
  end



  namespace :instructor do
    resources :sections, only: [:update]

    resources :courses, only: [:new, :create, :show] do
      resources :sections, only: [:new, :create]
    end
  end
end
