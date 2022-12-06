Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  get "/done", to: 'pages#done', as: :done
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"

  resources :playlists do
    post "upvote", to: "votes#upvote"
    post "downvote", to: "votes#downvote"
    post "send_to_spotify", to: "playlists#send_to_spotify"
    resources :votes, only: [:index]
  end
end
