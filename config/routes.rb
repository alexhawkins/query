Query::Application.routes.draw do
  resources :topics, except: [:index] do 
    resources :questions do
      resources :answers, only: [:create, :destroy]
    end
  end

  root to: 'questions#index'
end
