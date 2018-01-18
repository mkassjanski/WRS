Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  mount ActionCable.server => '/cable'
  devise_for :users
  #get 'rooms/:picture_id' => 'draw#show'
  resources :rooms, only: [:new, :create, :show, :index]
  root 'welcome#index'
end
