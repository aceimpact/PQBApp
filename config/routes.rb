Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show, :update, :destroy]
  resources :questions do
    resources :question_likes, only: [:create, :destroy]
    resources :answers, only: [:edit, :create, :update, :destroy] do
      resources :answer_likes, only: [:create, :destroy]
    end
  end
  root 'questions#index'

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
