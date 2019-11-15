Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      get 'tokens/create'
    end
  end
  # API definition
  namespace :api, defaults: { format: :json } do

    namespace :v1 do
      #We are going to list our resources here
      resources :users, only: %i[show create update destroy]
      resources :tokens, only: [:create]

    end

  end

end
