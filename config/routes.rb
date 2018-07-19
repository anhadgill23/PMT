Rails.application.routes.draw do
  post 'team_members/create'
  post 'team_members/destroy'
  devise_for :users, :controllers => { registrations: 'registrations' }
  root to: "teams#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resources :teams do
    resource :members, only: [:create, :destroy]
    resources :projects do
      resources :tasks
    end
  end
end
