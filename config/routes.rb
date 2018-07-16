Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  root to: "users#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resources :teams do
    resources :projects do
      resources :tasks
    end
  end
end
