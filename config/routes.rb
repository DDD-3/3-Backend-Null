Rails.application.routes.draw do
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/signout', to: 'sessions#destroy', as: 'signout'

  resources :users

  get ':user_id/followMovieList', to: 'users#follow_movies'

  resources :posts, only: [:show, :create, :update, :destroy] do
    resources :comments, only: [:create, :update, :destroy]
  end

  # 일단 정보를 open api에서 가져오는 것만 처리를 해주고, 추후 영화 팔로우 등과 같은 작업을 하면서 수정이 필요할 수도 있음
  resources :movies, only: [:show]

  get 'searchMovie/:title', to: 'movies#search', as: 'search_movie'
  get 'boxOfficeList', to: 'movies#boxoffice'
end