Rails.application.routes.draw do

  root "tasks#index"
  resources :tasks do
    resources :realizations
    member do
      get 'mark_as_done'
    end

  end
end
