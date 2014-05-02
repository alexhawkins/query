Query::Application.routes.draw do

  devise_for :users
  resources :users, only: [:show, :update, :index]
  get "home/index"
  resources :topics

  resources :questions do
    resources :follows, only: [:create, :destroy]
      get '/up-vote' => 'question_votes#up_vote', as: :up_vote
      get '/down-vote' => 'question_votes#down_vote', as: :down_vote
    resources :answers, only: [:create, :destroy, :show, :edit, :new] do
         get '/up-vote' => 'answer_votes#up_vote', as: :up_vote
         get '/down-vote' => 'answer_votes#down_vote', as: :down_vote
    end
  end
   
  #get '/answers_with_button', to: 'questions#show_with_button', as: 'answers_with_button'

  root to: 'topics#index'
end
