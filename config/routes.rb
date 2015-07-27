Rails.application.routes.draw do
  resources :users
  resources :sessions
  get "log_out" => "sessions#destroy", :as => "log_out"
  get "log_in" => "sessions#new", :as => "log_in"
  resources :sessions
  
  root to: "sessions#new"
  get "new_comment" => "comments#create"
  resources :swits do
    member do
      get 'like', to: "swits#upvote"
      get 'dislike', to: "swits#downvote"
    end
    resources :comments, only: [:index, :new, :create], controller: 'comments'

  end
end
