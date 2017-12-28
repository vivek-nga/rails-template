Rails.application.routes.draw do

  resources :chats
  get 'locations/index'

  get 'event/index'

    get 'dashboard/index'

	resources :articles do
		collection do
			get :generate
		end
	end
	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	devise_for :users, 
				controllers: { sessions: 'users/sessions',
	 						   registrations: 'users/registrations',
	  						   passwords: 'users/passwords' },
	   		    path_names: { sign_in: 'login',
							  sign_out: 'logout',
							  password: 'secret',
							  confirmation: 'verification',
							  registration: 'register',
							  sign_up: 'signup' }

	authenticated :user do
    	root 'dashboard#index', as: :authenticated_root
  	end
  	require 'sidekiq/web'
  	mount Sidekiq::Web => '/sidekiq'
	root 'welcome#index'
end
