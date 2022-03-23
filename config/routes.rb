Rails.application.routes.draw do
  namespace :api do
    # 認証
    post "/sign_up", to: "registrations#sign_up"
    post "/sign_in", to: "sessions#sign_in"
    delete "/sign_out", to: "sessions#sign_out"

    # 管理者
    namespace :admin do
      resources :travel_spots
      resources :users
      resources :genres
      resources :reviews
      get "/prefectures", to: "travel_spots#prefectures"
    end

    # エンドユーザー
    resources :travel_spots do
      member do
        post :favorite
        post :unfavorite
      end
      collection do
        get :rate_ranking
        get :fav_ranking
        get :review_ranking
      end
    end
    resources :users do
      member do
        post :follow
        post :unfollow
        get :followings
        get :followers
      end
    end
    resources :reviews
  end
end
