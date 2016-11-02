Rails.application.routes.draw do

  root to: 'pictures#index'
  get 'create_user', controller: :create_user, action: :create
  resources :pictures do
    member do
      get :img
    end
  end
  resources :photo

end
