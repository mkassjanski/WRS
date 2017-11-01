Rails.application.routes.draw do
  get 'welcome/index'
  resources :rooms
  root 'welcome#index'
end
