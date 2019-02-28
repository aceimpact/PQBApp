Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show, :update, :destroy]
  resources :questions do
    resources :answers, only: [:edit, :create, :update, :destroy]
  end
  root 'questions#index'

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
