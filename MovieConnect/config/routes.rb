Rails.application.routes.draw do
  resources :posts do
    resources :comments
  end

  resources :users

  # 일단 정보를 open api에서 가져오는 것만 처리를 해주고, 추후 영화 팔로우 등과 같은 작업을 하면서 수정이 필요할 수도 있음
  resources :movies, only: [:show]

  get 'searchMovie/:title', to: 'movies#search', as: 'search_movie'
  get 'boxOfficeList', to: 'movies#boxoffice'
end
