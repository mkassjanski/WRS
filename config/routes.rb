Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  mount ActionCable.server => '/cable'
  devise_for :users
  get '/', to: 'line#index'
  resources :rooms, only: [:new, :create, :show, :index]
  root 'welcome#index'
  post 'updateline', to: 'line#show'
end
