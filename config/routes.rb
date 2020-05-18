Rails.application.routes.draw do

  resources :bugs
  resources :notes
  mount Notifications::Engine => "/notifications"
  resources :todos
  resources :works

  resources :issues do
      resources :comments
  end

  resources :tasks
  resources :projects

  get 'team', to: 'users#team', as: :team
  get 'profile/:id', to: 'users#profile', as: :profile
  
  devise_for :users, :controllers => {:registrations => "registrations"}
  
	get 'dashboard', to: 'dashboard#index'

	# Root Page
  root 'dashboard#index'
  
end
