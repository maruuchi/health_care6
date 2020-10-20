Rails.application.routes.draw do
  devise_for :users
  root 'graphs#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resource :graphs, only: %i[index create update]
end
