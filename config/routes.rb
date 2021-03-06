Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #
  root to: 'enquiries#index'
  get "home/index", as: :home


  resources :enquiries, only: [:index, :show, :update, :edit]
  resources :enquiry_states, only: [] do
    member do
      Enquiry.states.keys.each do |action|
        get action
      end
    end
  end
  resources :imports, only: [:create]
end
