Rails.application.routes.draw do
  root to: "pages#home"

  resources :csv_files do
    collection do
      post :upload
    end
    member do
      post :clone
      get "get_values"
    end
  end
end
