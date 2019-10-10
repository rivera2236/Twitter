Rails.application.routes.draw do
  get 'epicenter/fee'
  get 'epicenter/show_user'
  get 'epicenter/now_following'
  get 'epicenter/unfollow'
  resources :twits
  devise_for :users
  root "twits#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
