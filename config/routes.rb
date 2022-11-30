Rails.application.routes.draw do
  namespace :api, default: { format: :json } do
    namespace :v1 do
      post 'login', to: 'sessions#login', as: :login
      resources :shows, only: %i[index show create destroy]
      resources :users, only: %i[show update]
    end
  end
end
