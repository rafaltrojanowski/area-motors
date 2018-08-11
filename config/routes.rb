Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #
  root to: 'home#index'
  get "home/index"


  resources :enquiries, only: [:index, :show]
  resources :enquiry_states, only: [] do
    member do
      get :done
    end
  end
  resources :imports, only: [:create]
end
