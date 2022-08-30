Rails.application.routes.draw do
  get 'trains/edit'
  resource :session, only: %i[new show create destroy]
  resources :admins, only: %i[index show new create edit update destroy]
  resources :stations, only: %i[index show new create edit update destroy]
  resources :trains, only: %i[index show new create edit update destroy]
  root 'stations#index'
end
