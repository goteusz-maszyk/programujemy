Rails.application.routes.draw do

  resources :issues do
  end

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  devise_scope :user do
    get '/zaloguj', to: 'users/sessions#new'
    get '/profile', to: 'profile#edit'
  end
  # get '/:username', to: 'users#show'
  
  namespace :admin do
    scope(path_names: { new: 'nowy', edit: 'edytuj' }) do
      resources :users, path: 'uzytkownicy' do
        get :lock_user
      end
    end
    root 'users#index'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'home#index'

end
