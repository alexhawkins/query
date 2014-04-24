Query::Application.routes.draw do

  devise_for :users
  get "home/index"
  resources :topics do 
    resources :questions do
      resources :answers, only: [:create, :destroy, :show, :edit, :new]
    end
  end

  root to: 'topics#index'
end
