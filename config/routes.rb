Rails.application.routes.draw do
  resource :session, only: %i[new show create destroy]
  resources :admins, only: %i[index show new create edit update destroy]
  resources :stations, only: %i[index show new create edit update destroy]
  root 'stations#index'
end
