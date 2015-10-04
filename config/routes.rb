Rails.application.routes.draw do
  get 'welcome/index'
  devise_scope :user do
    get 'users/onboard', to: 'users#onboard', as: 'onboard'
  end
  devise_for :users, :controllers => { :registrations => 'users' }

  resource :geolocation, only:[:show]
  resource :protection_mode, only:[:create]

  root 'welcome#index'

  post 'alarms/:watchbug_id', to: 'alarms#create', as:'alarms_create'
end
