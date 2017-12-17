Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  mount ActionCable.server => '/cable'
  devise_for :users
  get 'welcome/index'
  resources :rooms, only: [:new, :create, :show, :index]
  root 'rooms#index'
end
