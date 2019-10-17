Rails.application.routes.draw do
  


  get 'feed' => 'epicenter#feed'
  get 'show_user' => 'epicenter#show_user'
  get 'now_following' => 'epicenter#now_following'
  get 'unfollow' => 'epicenter#unfollow'
  root 'epicenter#feed'
  resources :twits
  devise_for :users
  get 'tag_twits' => 'epicenter#tag_twits'
  get 'all_users' => 'epicenter#all_users'

  get 'following' => 'epicenter#following'
  get 'followers' => 'epicenter#followers'

  # root "twits#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
