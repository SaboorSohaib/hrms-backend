Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  get 'users/employees/:employee_id/addresses', to: 'addresses#index'
  get 'users/employees/:employee_id/job_infos', to: 'job_infos#index'
  get 'users/employees/:employee_id/contracts', to: 'contracts#index'
  get 'users/employees/:employee_id/salaries', to: 'salaries#index'
  get 'users/employees/:employee_id/attendances', to: 'attendances#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :show, :new, :create ] do
    resources :employees, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
      resources :addresses, only: [:new, :create, :update]
      resources :attendances, only: [:new, :create, :update]
      resources :contracts, only: [:new, :create, :update]
      resources :salaries, only: [:new, :create, :update]
      resources :job_infos, only: [:new, :create, :update]
    end
  end

  resources :departments, only: [:index, :show, :new, :create, :update, :destroy] do
    resources :projects, only: [:index, :show, :new, :create, :update, :destroy]
    resources :reports, only: [:index, :show, :new, :create, :update, :destroy]
  end
end
