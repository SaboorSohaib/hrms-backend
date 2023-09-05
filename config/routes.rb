Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :show, :new, :create ] do
    resources :employees, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
      resources :attendances, only: [:index, :new, :create, :destroy]
      resources :contracts, only: [:new, :create, :destroy]
      resources :salaries, only: [:new, :create, :update, :destroy]
      resources :addresses, only: [:new, :create, :update, :destroy]
      resources :jobs_info, only: [:new, :create, :update, :destroy]
    end
  end

  resources :departments, only: [:index, :show, :new, :create, :update, :destroy] do
    resources :projects, only: [:index, :show, :new, :create, :update, :destroy]
    resources :reports, only: [:index, :show, :new, :create, :update, :destroy]
  end
end
